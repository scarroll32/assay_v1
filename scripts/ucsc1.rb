require 'bio-ucsc'

 include Bio # shorthand for ommitting the "Bio::" prefix
 Ucsc::Hg19.connect

result = Ucsc::Hg19::Cosmic.find_by_name("COSM536198")
puts result.chrom

# load a locally-stored sequence file, and extract partial sequence
seq = Ucsc::File::Twobit.open("../db/hg19/hg19.2bit")
puts seq.subseq("chr1:9990-10009")  # => "NNNNNNNNNNNTAACCCTAA"  |

puts seq.subseq("chr14:105246496-105246497")

puts seq.subseq("chr14:105246396-105246597")


