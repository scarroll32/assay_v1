#load the library
require 'bio-ucsc'

# shorthand for omitting 'Bio' prefix
include Bio

# connect to UCSC offical mysql server for Hg19
Ucsc::Hg19.connect

# connect to a local mirror for Hg18
Ucsc::Hg18.connect {:db_host => 'localhost',
                    :db_username => 'genome',
                    :db_password => ''}

# find the first record by the SNP ID and extract it's chromosome number
result = Ucsc::Hg19::Snp131.find_by_name("rs56289060")
puts result.chrom # => "chr1"

# "with_interval" method searches features on the given region
# "with_interval_excl" methods exclude partly overlapping features
region = "chr17:7,579,614-7,579,700"
puts Ucsc::Hg19::Snp131.with_interval(region).find(:all).size # => 9
puts Ucsc::Hg19::Snp131.with_interval_excl(region).find(:all).size # => 8

#given the combined search conditions, a SQL statement is generated on demand
# and the corresponding "bin" numbers are calculated automatically.
condition = Ucsc::Hg19::Snp131.with_interval(region).select(name)
puts condition.to_sql # => SELECT name FROM `snp131`
                      #    WHERE (chrom = 'chr17' AND bin in (642,80,9,1,0)
                      #      AND (( chromStart BETWEEN 7579613 AND 7579700)
                      #       OR ( chromEnd BETWEEN 7579613 AND 7579700)
                      #       OR (chromStart <= 7579613 AND chromEND >= 7579700)));

# apply multiple search conditions by the "find_xxx_and_yyy" method
puts condition.find_all_by_class_and_strand("in-del", "+").size # => 1

# instance for genePred table records has #exons, #cdss and #introns methods
# These methods return an instance of Bio::GenomicInterval
hit = Ucsc::Hg19::RefGene.find_by_name2("UVSSA")
puts "#{hit.exons.size}, #{hit.cdses.size}"  # => "14, 13"
puts hit.exons[0] # => chr4:1341104-1341548
puts hit.introns[0] # => chr4:1341549-1341877
puts hit.cdss[0]  # => chr4:1341880-1341977

# automatic declaration of the table association using the all.joiner schema file
joiner - Bio::Ucsc::Schema::Joiner.load
joiner.variables["gbd"] = ["hg19"]
joiner.define_associations(Ucsc::Hg19::Snp131)
puts Ucsc::Hg19::Snp131.find_by_name("rs242").snp131Seq.first_offset  # => 1112

# manual declaration of the table association 
Ucsc::Hg19::knownGene.class_eval do
  has_one :knownToEnsembl, {:primary_key => :name, :foreign_key => :name}
end
puts Ucsc::Hg19::KnownGene.first_name  # => "uc001aaa3"
puts Ucsc::Hg19::KnownGene.first.knownToEnsembl.value   # => "ENST00000456328"

# load a locally-stored sequence file, and extract partial sequence
seq = Ucsc::File::Twobit.open("hg19.2bit")
puts seq.subseq("chr1:9990-10009")  # => "NNNNNNNNNNNTAACCCTAA"  |
  
end
