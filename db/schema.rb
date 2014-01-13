# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20131215081347) do

  create_table "ampliseqs", :id => false, :force => true do |t|
    t.integer  "id",               :null => false
    t.string   "gene"
    t.string   "accession_number"
    t.string   "cosmic_mut_id"
    t.text     "mut_syntax_cds"
    t.string   "mut_syntax_aa"
    t.string   "strand"
    t.string   "hg19_coordinates"
    t.string   "amplicon_id"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "ampliseqs_tmp", :id => false, :force => true do |t|
    t.string "gene"
    t.string "accession_number"
    t.string "cosmic_mut_id"
    t.text   "mut_syntax_cds"
    t.string "mut_syntax_aa"
    t.string "strand"
    t.string "hg19_coordinates"
    t.string "amplicon_id"
  end

  create_table "batch_details", :force => true do |t|
    t.integer  "batch_id"
    t.string   "gene"
    t.string   "grch37_start"
    t.string   "grch37_stop"
    t.string   "status"
    t.datetime "created_at",               :null => false
    t.datetime "updated_at",               :null => false
    t.string   "hg19_coordinates"
    t.integer  "bin"
    t.string   "chrom"
    t.integer  "chrom_start"
    t.integer  "chrom_end"
    t.text     "dna"
    t.string   "cosmic_mut_id"
    t.text     "primer3_raw"
    t.text     "primer3_formatted"
    t.string   "step"
    t.string   "forward_base_pair_offset"
    t.string   "reverse_base_pair_offset"
  end

  add_index "batch_details", ["batch_id"], :name => "index_batch_details_on_batch_id"

  create_table "batches", :force => true do |t|
    t.string   "status"
    t.datetime "status_timestamp"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.string   "description"
    t.text     "details"
    t.integer  "user_id"
    t.string   "step"
    t.integer  "primer3_setting_id"
    t.string   "source"
  end

  create_table "cosmic_60", :id => false, :force => true do |t|
    t.integer "id"
    t.text    "cosmic_release"
    t.text    "cosmic_mut_id"
    t.text    "gene"
    t.text    "accession_number"
    t.text    "mut_description"
    t.text    "mut_syntax_cds"
    t.text    "mut_syntax_aa"
    t.text    "chromosome"
    t.text    "grch37_start"
    t.text    "grch37_stop"
    t.text    "mut_nt"
    t.text    "mut_aa"
    t.text    "tumour_site"
    t.integer "mutated_samples"
    t.integer "examined_samples"
    t.text    "mut_freq"
    t.text    "created_at"
    t.text    "updated_at"
    t.text    "vogel"
    t.text    "ampliseq"
    t.text    "selected"
  end

  create_table "cosmic_61", :id => false, :force => true do |t|
    t.integer "id"
    t.text    "cosmic_release"
    t.text    "cosmic_mut_id"
    t.text    "gene"
    t.text    "accession_number"
    t.text    "mut_description"
    t.text    "mut_syntax_cds"
    t.text    "mut_syntax_aa"
    t.text    "chromosome"
    t.text    "grch37_start"
    t.text    "grch37_stop"
    t.text    "mut_nt"
    t.text    "mut_aa"
    t.text    "tumour_site"
    t.integer "mutated_samples"
    t.integer "examined_samples"
    t.text    "mut_freq"
    t.text    "created_at"
    t.text    "updated_at"
    t.text    "vogel"
    t.text    "ampliseq"
    t.text    "selected"
  end

  create_table "cosmic_62", :id => false, :force => true do |t|
    t.integer "id"
    t.text    "cosmic_release"
    t.text    "cosmic_mut_id"
    t.text    "gene"
    t.text    "accession_number"
    t.text    "mut_description"
    t.text    "mut_syntax_cds"
    t.text    "mut_syntax_aa"
    t.text    "chromosome"
    t.text    "grch37_start"
    t.text    "grch37_stop"
    t.text    "mut_nt"
    t.text    "mut_aa"
    t.text    "tumour_site"
    t.integer "mutated_samples"
    t.integer "examined_samples"
    t.text    "mut_freq"
    t.text    "created_at"
    t.text    "updated_at"
    t.text    "vogel"
    t.text    "ampliseq"
    t.text    "selected"
  end

  create_table "cosmic_63", :id => false, :force => true do |t|
    t.integer "id"
    t.text    "cosmic_release"
    t.text    "cosmic_mut_id"
    t.text    "gene"
    t.text    "accession_number"
    t.text    "mut_description"
    t.text    "mut_syntax_cds"
    t.text    "mut_syntax_aa"
    t.text    "chromosome"
    t.text    "grch37_start"
    t.text    "grch37_stop"
    t.text    "mut_nt"
    t.text    "mut_aa"
    t.text    "tumour_site"
    t.integer "mutated_samples"
    t.integer "examined_samples"
    t.text    "mut_freq"
    t.text    "created_at"
    t.text    "updated_at"
    t.text    "vogel"
    t.text    "ampliseq"
    t.text    "selected"
  end

  create_table "cosmic_64", :id => false, :force => true do |t|
    t.integer "id"
    t.text    "cosmic_release"
    t.text    "cosmic_mut_id"
    t.text    "gene"
    t.text    "accession_number"
    t.text    "mut_description"
    t.text    "mut_syntax_cds"
    t.text    "mut_syntax_aa"
    t.text    "chromosome"
    t.text    "grch37_start"
    t.text    "grch37_stop"
    t.text    "mut_nt"
    t.text    "mut_aa"
    t.text    "tumour_site"
    t.integer "mutated_samples"
    t.integer "examined_samples"
    t.text    "mut_freq"
    t.text    "created_at"
    t.text    "updated_at"
    t.text    "vogel"
    t.text    "ampliseq"
    t.text    "selected"
  end

  create_table "cosmic_65", :id => false, :force => true do |t|
    t.integer "id"
    t.text    "cosmic_release"
    t.text    "cosmic_mut_id"
    t.text    "gene"
    t.text    "accession_number"
    t.text    "mut_description"
    t.text    "mut_syntax_cds"
    t.text    "mut_syntax_aa"
    t.text    "chromosome"
    t.text    "grch37_start"
    t.text    "grch37_stop"
    t.text    "mut_nt"
    t.text    "mut_aa"
    t.text    "tumour_site"
    t.integer "mutated_samples"
    t.integer "examined_samples"
    t.text    "mut_freq"
    t.text    "created_at"
    t.text    "updated_at"
    t.text    "vogel"
    t.text    "ampliseq"
    t.text    "selected"
  end

  create_table "cosmic_65_tmp", :id => false, :force => true do |t|
    t.integer "id"
    t.text    "cosmic_release"
    t.text    "cosmic_mut_id"
    t.text    "gene"
    t.text    "accession_number"
    t.text    "mut_description"
    t.text    "mut_syntax_cds"
    t.text    "mut_syntax_aa"
    t.text    "chromosome"
    t.text    "grch37_start"
    t.text    "grch37_stop"
    t.text    "mut_nt"
    t.text    "mut_aa"
    t.text    "tumour_site"
    t.integer "mutated_samples"
    t.integer "examined_samples"
    t.text    "mut_freq"
    t.text    "created_at"
    t.text    "updated_at"
    t.text    "vogel"
    t.text    "ampliseq"
    t.text    "selected"
  end

  create_table "cosmic_66", :id => false, :force => true do |t|
    t.integer "id"
    t.text    "cosmic_release"
    t.text    "cosmic_mut_id"
    t.text    "gene"
    t.text    "accession_number"
    t.text    "mut_description"
    t.text    "mut_syntax_cds"
    t.text    "mut_syntax_aa"
    t.text    "chromosome"
    t.text    "grch37_start"
    t.text    "grch37_stop"
    t.text    "mut_nt"
    t.text    "mut_aa"
    t.text    "tumour_site"
    t.integer "mutated_samples"
    t.integer "examined_samples"
    t.text    "mut_freq"
    t.text    "created_at"
    t.text    "updated_at"
    t.text    "vogel"
    t.text    "ampliseq"
    t.text    "selected"
  end

  create_table "cosmics", :force => true do |t|
    t.string   "cosmic_release"
    t.string   "cosmic_mut_id"
    t.string   "gene"
    t.string   "accession_number"
    t.text     "mut_description"
    t.text     "mut_syntax_cds"
    t.text     "mut_syntax_aa"
    t.text     "chromosome"
    t.string   "grch37_start"
    t.string   "grch37_stop"
    t.text     "mut_nt"
    t.text     "mut_aa"
    t.text     "tumour_site"
    t.integer  "mutated_samples"
    t.integer  "examined_samples"
    t.decimal  "mut_freq"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.boolean  "vogel"
    t.boolean  "ampliseq"
    t.boolean  "selected"
    t.text     "mut_nt_txt"
    t.text     "mut_aa_txt"
    t.text     "gene_base"
    t.boolean  "stanford"
  end

  create_table "cosmics_tmp", :id => false, :force => true do |t|
    t.text "cosmic_release"
    t.text "cosmic_mut_id"
    t.text "gene"
    t.text "accession_number"
    t.text "mut_description"
    t.text "mut_syntax_cds"
    t.text "mut_syntax_aa"
    t.text "chromosome"
    t.text "grch37_start"
    t.text "grch37_stop"
    t.text "mut_nt"
    t.text "mut_aa"
    t.text "tumour_site"
    t.text "mutated_samples"
    t.text "examined_samples"
    t.text "mut_freq"
  end

  create_table "data_sources", :force => true do |t|
    t.string   "name"
    t.string   "version"
    t.string   "filename"
    t.datetime "loaded_dttm"
    t.string   "status"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "delayed_jobs", :force => true do |t|
    t.integer  "priority",   :default => 0, :null => false
    t.integer  "attempts",   :default => 0, :null => false
    t.text     "handler",                   :null => false
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.string   "queue"
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

  add_index "delayed_jobs", ["priority", "run_at"], :name => "delayed_jobs_priority"

  create_table "primer3_batches", :force => true do |t|
    t.datetime "created_at",                                                                                                                                            :null => false
    t.datetime "updated_at",                                                                                                                                            :null => false
    t.integer  "user_id"
    t.string   "status"
    t.string   "p3_file_type",                            :default => "settings"
    t.integer  "primer_first_base_index",                 :default => 1
    t.string   "primer_task",                             :default => "generic"
    t.string   "p3_file_id",                              :default => "Settings for PCR amplification followed by Sanger sequencing on both strands using PCR primers"
    t.integer  "primer_min_three_prime_distance",         :default => 3
    t.integer  "primer_explain_flag",                     :default => 1
    t.string   "primer_mispriming_library",               :default => ""
    t.decimal  "primer_max_library_mispriming",           :default => 12.0
    t.decimal  "primer_pair_max_library_mispriming",      :default => 20.0
    t.string   "primer_product_size_range",               :default => "150-250 100-300 301-400 401-500 501-600 601-700 701-850 851-1000"
    t.integer  "primer_num_return",                       :default => 5
    t.decimal  "primer_max_end_stability",                :default => 9.0
    t.decimal  "primer_max_self_any_th",                  :default => 45.0
    t.decimal  "primer_max_self_end_th",                  :default => 35.0
    t.decimal  "primer_pair_max_compl_any_th",            :default => 45.0
    t.decimal  "primer_pair_max_compl_end_th",            :default => 35.0
    t.decimal  "primer_max_hairpin_th",                   :default => 24.0
    t.decimal  "primer_max_template_mispriming_th",       :default => 40.0
    t.decimal  "primer_pair_max_template_mispriming_th",  :default => 70.0
    t.integer  "primer_min_size",                         :default => 18
    t.integer  "primer_opt_size",                         :default => 20
    t.integer  "primer_max_size",                         :default => 23
    t.decimal  "primer_min_tm",                           :default => 57.0
    t.decimal  "primer_opt_tm",                           :default => 59.0
    t.decimal  "primer_max_tm",                           :default => 62.0
    t.decimal  "primer_pair_max_diff_tm",                 :default => 5.0
    t.integer  "primer_tm_formula",                       :default => 1
    t.decimal  "primer_salt_monovalent",                  :default => 50.0
    t.integer  "primer_salt_corrections",                 :default => 1
    t.decimal  "primer_salt_divalent",                    :default => 1.5
    t.decimal  "primer_dntp_conc",                        :default => 0.6
    t.decimal  "primer_dna_conc",                         :default => 50.0
    t.integer  "primer_thermodynamic_oligo_alignment",    :default => 1
    t.integer  "primer_thermodynamic_template_alignment", :default => 0
    t.integer  "primer_lowercase_masking",                :default => 0
    t.decimal  "primer_min_gc",                           :default => 30.0
    t.decimal  "primer_max_gc",                           :default => 70.0
    t.integer  "primer_max_ns_accepted",                  :default => 0
    t.integer  "primer_max_poly_x",                       :default => 4
    t.integer  "primer_outside_penalty",                  :default => 0
    t.integer  "primer_gc_clamp",                         :default => 0
    t.integer  "primer_liberal_base",                     :default => 1
    t.integer  "primer_lib_ambiguity_codes_consensus",    :default => 0
    t.integer  "primer_pick_anyway",                      :default => 1
    t.decimal  "primer_wt_tm_lt",                         :default => 1.0
    t.decimal  "primer_wt_tm_gt",                         :default => 1.0
    t.decimal  "primer_wt_size_lt",                       :default => 1.0
    t.decimal  "primer_wt_size_gt",                       :default => 1.0
    t.decimal  "primer_wt_gc_percent_lt",                 :default => 0.0
    t.decimal  "primer_wt_gc_percent_gt",                 :default => 0.0
    t.decimal  "primer_wt_self_any_th",                   :default => 0.0
    t.decimal  "primer_wt_self_end_th",                   :default => 0.0
    t.decimal  "primer_wt_hairpin_th",                    :default => 0.0
    t.decimal  "primer_wt_num_ns",                        :default => 0.0
    t.decimal  "primer_wt_library_mispriming",            :default => 0.0
    t.decimal  "primer_wt_seq_qual",                      :default => 0.0
    t.decimal  "primer_wt_end_qual",                      :default => 0.0
    t.decimal  "primer_wt_pos_penalty",                   :default => 0.0
    t.decimal  "primer_wt_end_stability",                 :default => 0.0
    t.decimal  "primer_wt_template_mispriming_th",        :default => 0.0
    t.decimal  "primer_pair_wt_product_size_lt",          :default => 0.0
    t.decimal  "primer_pair_wt_product_size_gt",          :default => 0.0
    t.decimal  "primer_pair_wt_product_tm_lt",            :default => 0.0
    t.decimal  "primer_pair_wt_product_tm_gt",            :default => 0.0
    t.decimal  "primer_pair_wt_diff_tm",                  :default => 0.0
    t.decimal  "primer_pair_wt_compl_any_th",             :default => 0.0
    t.decimal  "primer_pair_wt_compl_end_th",             :default => 0.0
    t.decimal  "primer_pair_wt_library_mispriming",       :default => 0.0
    t.decimal  "primer_pair_wt_pr_penalty",               :default => 1.0
    t.decimal  "primer_pair_wt_io_penalty",               :default => 0.0
    t.decimal  "primer_pair_wt_template_mispriming",      :default => 0.0
    t.decimal  "primer_internal_wt_size_lt",              :default => 1.0
    t.decimal  "primer_internal_wt_end_qual",             :default => 0.0
    t.decimal  "primer_internal_max_self_end",            :default => 12.0
    t.integer  "primer_quality_range_min",                :default => 0
    t.decimal  "primer_pair_max_compl_end",               :default => 3.0
    t.decimal  "primer_product_max_tm",                   :default => 1000000.0
    t.integer  "primer_internal_max_size",                :default => 27
    t.decimal  "primer_internal_wt_self_any",             :default => 0.0
    t.integer  "primer_internal_max_poly_x",              :default => 5
    t.decimal  "primer_internal_wt_size_gt",              :default => 1.0
    t.integer  "primer_sequencing_accuracy",              :default => 20
    t.decimal  "primer_internal_wt_tm_gt",                :default => 1.0
    t.decimal  "primer_internal_wt_library_mishyb",       :default => 0.0
    t.decimal  "primer_internal_max_gc",                  :default => 80.0
    t.decimal  "primer_pair_wt_compl_any",                :default => 0.0
    t.integer  "primer_pick_internal_oligo",              :default => 0
    t.decimal  "primer_max_self_end",                     :default => 3.0
    t.integer  "primer_quality_range_max",                :default => 100
    t.decimal  "primer_internal_dntp_conc",               :default => 0.0
    t.integer  "primer_internal_min_size",                :default => 18
    t.integer  "primer_internal_min_quality",             :default => 0
    t.integer  "primer_sequencing_interval",              :default => 250
    t.decimal  "primer_internal_salt_divalent",           :default => 1.5
    t.decimal  "primer_max_self_any",                     :default => 8.0
    t.decimal  "primer_internal_wt_seq_qual",             :default => 0.0
    t.decimal  "primer_pair_wt_compl_end",                :default => 0.0
    t.decimal  "primer_internal_opt_tm",                  :default => 60.0
    t.decimal  "primer_internal_max_self_any",            :default => 12.0
    t.integer  "primer_min_end_quality",                  :default => 0
    t.decimal  "primer_internal_min_tm",                  :default => 57.0
    t.decimal  "primer_pair_max_compl_any",               :default => 8.0
    t.integer  "primer_sequencing_lead",                  :default => 50
    t.integer  "primer_pick_left_primer",                 :default => 1
    t.integer  "primer_internal_opt_size",                :default => 20
    t.decimal  "primer_wt_template_mispriming",           :default => 0.0
    t.integer  "primer_max_end_gc",                       :default => 5
    t.integer  "primer_min_quality",                      :default => 0
    t.decimal  "primer_internal_max_library_mishyb",      :default => 12.0
    t.decimal  "primer_internal_wt_gc_percent_gt",        :default => 0.0
    t.integer  "primer_internal_max_ns_accepted",         :default => 0
    t.decimal  "primer_wt_self_any",                      :default => 0.0
    t.decimal  "primer_max_template_mispriming",          :default => 12.0
    t.decimal  "primer_internal_wt_num_ns",               :default => 0.0
    t.decimal  "primer_internal_wt_self_end",             :default => 0.0
    t.integer  "primer_product_opt_size",                 :default => 0
    t.decimal  "primer_product_opt_tm",                   :default => 0.0
    t.decimal  "primer_pair_max_template_mispriming",     :default => 24.0
    t.decimal  "primer_inside_penalty",                   :default => -1.0
    t.decimal  "primer_internal_min_gc",                  :default => 20.0
    t.decimal  "primer_product_min_tm",                   :default => -1000000.0
    t.decimal  "primer_internal_salt_monovalent",         :default => 50.0
    t.decimal  "primer_wt_self_end",                      :default => 0.0
    t.decimal  "primer_internal_dna_conc",                :default => 50.0
    t.integer  "primer_pick_right_primer",                :default => 1
    t.decimal  "primer_internal_max_tm",                  :default => 63.0
    t.decimal  "primer_internal_wt_gc_percent_lt",        :default => 0.0
    t.decimal  "primer_internal_wt_tm_lt",                :default => 1.0
    t.integer  "batch_detail_id"
    t.string   "primer_sequence_id"
    t.string   "sequence"
    t.string   "excluded_region"
    t.string   "target"
    t.string   "included_region"
    t.text     "sequence_template"
    t.string   "sequence_primer"
    t.string   "sequence_internal_oligo"
    t.string   "sequence_primer_revcomp"
    t.decimal  "primer_opt_gc_percent"
    t.integer  "primer_tm_santalucia"
    t.decimal  "primer_self_any"
    t.decimal  "primer_self_end"
    t.decimal  "primer_max_mispriming"
    t.decimal  "primer_max_repeat_mispriming"
    t.string   "primer_name_acronym_left"
    t.string   "primer_name_acronym_right"
    t.string   "primer_name_acronym_spacer"
    t.string   "primer_name_acronym_internal"
    t.string   "primer_internal_oligo_excluded_region"
    t.integer  "primer_internal_oligo_min_size"
    t.integer  "primer_internal_oligo_opt_size"
    t.integer  "primer_internal_oligo_max_size"
    t.decimal  "primer_internal_oligo_min_tm"
    t.decimal  "primer_internal_oligo_opt_tm"
    t.decimal  "primer_internal_oligo_max_tm"
    t.integer  "primer_num_ns_accepted"
    t.integer  "primer_internal_oligo_max_poly_x"
    t.integer  "primer_io_wt_num_ns"
    t.decimal  "primer_io_wt_compl_any"
    t.decimal  "primer_internal_oligo_self_end"
    t.decimal  "primer_internal_oligo_max_mishyb"
    t.decimal  "primer_internal_oligo_min_mishby"
    t.decimal  "primer_internal_oligo_salt_conc"
    t.decimal  "primer_internal_oligo_dna_conc"
    t.decimal  "primer_internal_divalent_conc"
    t.decimal  "primer_wt_rep_sim"
    t.decimal  "primer_wt_compl_any"
    t.decimal  "primer_wt_compl_end"
    t.decimal  "primer_io_wt_tm_lt"
    t.decimal  "primer_io_wt_tm_gt"
    t.decimal  "primer_io_wt_size_lt"
    t.decimal  "primer_io_wt_size_gt"
    t.boolean  "primer_io_wt_rep_sim"
    t.boolean  "primer_io_wt_coml_any"
    t.decimal  "primer_io_wt_seq_qual"
    t.integer  "primer_start_codon_position"
    t.text     "primer_sequence_quality"
    t.string   "type"
    t.boolean  "public_profile"
    t.integer  "primer_sequencing_spacing"
    t.string   "sequence_id"
    t.integer  "sequence_force_left_start"
    t.integer  "sequence_force_left_end"
    t.integer  "sequence_force_right_start"
    t.integer  "sequence_force_right_end"
    t.integer  "primer_min_left_three_prime_distance"
    t.integer  "primer_min_right_three_prime_distance"
    t.integer  "primer_min_5_prime_overlap_of_junction"
    t.integer  "primer_min_3_prime_overlap_of_junction"
    t.boolean  "show_debugging_input"
    t.decimal  "primer_pair_wt_template_mispriming_th"
    t.decimal  "primer_internal_opt_gc_percent"
    t.decimal  "primer_internal_max_self_any_th"
    t.decimal  "primer_internal_max_hairpin_th"
    t.string   "primer_internal_mishyb_library"
    t.decimal  "primer_internal_wt_self_any_th"
    t.decimal  "primer_internal_wt_self_end_th"
    t.decimal  "primer_internal_wt_hairpin_th"
    t.decimal  "primer_internal_max_self_end_th"
  end

  create_table "primer3_output_pairs", :force => true do |t|
    t.string   "primer_left_problems"
    t.string   "primer_internal_problems"
    t.string   "primer_right_problems"
    t.integer  "primer_left"
    t.integer  "primer_internal"
    t.integer  "primer_right"
    t.string   "primer_left_sequence"
    t.string   "primer_internal_sequence"
    t.string   "primer_right_sequence"
    t.string   "primer_pair_product_size"
    t.decimal  "primer_left_penalty"
    t.decimal  "primer_internal_penalty"
    t.decimal  "primer_right_penalty"
    t.decimal  "primer_pair_penalty"
    t.decimal  "primer_left_tm"
    t.decimal  "primer_internal_tm"
    t.decimal  "primer_right_tm"
    t.decimal  "primer_pair_product_tm"
    t.decimal  "primer_pair_product_tm_oligo_tm_diff"
    t.decimal  "primer_pair_t_opt_a"
    t.decimal  "primer_left_gc_percent"
    t.decimal  "primer_internal_gc_percent"
    t.decimal  "primer_right_gc_percent"
    t.decimal  "primer_left_self_any"
    t.decimal  "primer_internal_self_any"
    t.decimal  "primer_right_self_any"
    t.decimal  "primer_left_self_any_th"
    t.decimal  "primer_internal_self_any_th"
    t.decimal  "primer_right_self_any_th"
    t.decimal  "primer_right_hairpin_th"
    t.decimal  "primer_pair_compl_any"
    t.decimal  "primer_pair_compl_any_th"
    t.decimal  "primer_left_self_end"
    t.decimal  "primer_internal_self_end"
    t.decimal  "primer_right_self_end"
    t.decimal  "primer_left_self_end_th"
    t.decimal  "primer_internal_self_end_th"
    t.decimal  "primer_right_self_end_th"
    t.decimal  "primer_left_hairpin_th"
    t.decimal  "primer_internal_hairpin_th"
    t.decimal  "primer_pair_compl_end"
    t.decimal  "primer_pair_compl_end_th"
    t.decimal  "primer_left_end_stability"
    t.decimal  "primer_right_end_stability"
    t.decimal  "primer_left_template_mispriming"
    t.decimal  "primer_right_template_mispriming"
    t.decimal  "primer_pair_template_mispriming"
    t.decimal  "primer_left_template_mispriming_th"
    t.decimal  "primer_right_template_mispriming_th"
    t.decimal  "primer_pair_template_mispriming_th"
    t.string   "primer_left_library_mispriming"
    t.string   "primer_right_library_mispriming"
    t.string   "primer_pair_library_mispriming"
    t.string   "primer_internal_library_mishyb"
    t.integer  "primer_left_min_seq_quality"
    t.integer  "primer_internal_min_seq_quality"
    t.integer  "primer_right_min_seq_quality"
    t.integer  "primer_left_position_penalty"
    t.integer  "primer_right_position_penalty"
    t.datetime "created_at",                           :null => false
    t.datetime "updated_at",                           :null => false
  end

  create_table "primer3_outputs", :force => true do |t|
    t.string   "primer_error"
    t.string   "primer_warning"
    t.integer  "primer_left_num_returned"
    t.integer  "primer_right_num_returned"
    t.integer  "primer_interval_num_returned"
    t.integer  "primer_pair_num_returned"
    t.datetime "created_at",                   :null => false
    t.datetime "updated_at",                   :null => false
    t.string   "primer_left_explain"
    t.string   "primer_internal_explain"
    t.string   "primer_right_explain"
    t.string   "primer_pair_explain"
    t.integer  "primer_stop_codon_position"
  end

  create_table "primer3s", :force => true do |t|
    t.string   "type"
    t.integer  "user_id"
    t.integer  "batch_detail_id"
    t.boolean  "generated"
    t.string   "status"
    t.string   "p3_file_type"
    t.string   "p3_file_id"
    t.boolean  "p3_file_flag"
    t.string   "p3_comment"
    t.string   "sequence_excluded_region"
    t.integer  "sequence_force_left_end"
    t.integer  "sequence_force_left_start"
    t.integer  "sequence_force_right_end"
    t.integer  "sequence_force_right_start"
    t.string   "sequence_id"
    t.string   "sequence_included_region"
    t.string   "sequence_internal_excluded_region"
    t.string   "sequence_internal_oligo"
    t.string   "sequence_overlap_junction_list"
    t.string   "sequence_primer"
    t.string   "sequence_primer_pair_ok_region_list"
    t.string   "sequence_primer_revcomp"
    t.string   "sequence_quality"
    t.integer  "sequence_start_codon_position"
    t.string   "sequence_target"
    t.text     "sequence_template"
    t.decimal  "primer_dna_conc"
    t.decimal  "primer_dntp_conc"
    t.integer  "primer_explain_flag"
    t.integer  "primer_first_base_index"
    t.integer  "primer_gc_clamp"
    t.decimal  "primer_inside_penalty"
    t.decimal  "primer_internal_dna_conc"
    t.decimal  "primer_internal_dntp_conc"
    t.decimal  "primer_internal_max_gc"
    t.decimal  "primer_internal_max_hairpin_th"
    t.decimal  "primer_internal_max_library_mishyb"
    t.integer  "primer_internal_max_ns_accepted"
    t.integer  "primer_internal_max_poly_x"
    t.decimal  "primer_internal_max_self_any"
    t.decimal  "primer_internal_max_self_any_th"
    t.decimal  "primer_internal_max_self_end"
    t.decimal  "primer_internal_max_self_end_th"
    t.integer  "primer_internal_max_size"
    t.decimal  "primer_internal_max_tm"
    t.decimal  "primer_internal_min_gc"
    t.integer  "primer_internal_min_quality"
    t.integer  "primer_internal_min_size"
    t.decimal  "primer_internal_min_tm"
    t.string   "primer_internal_mishyb_library"
    t.decimal  "primer_internal_opt_gc_percent"
    t.integer  "primer_internal_opt_size"
    t.decimal  "primer_internal_opt_tm"
    t.decimal  "primer_internal_salt_divalent"
    t.decimal  "primer_internal_salt_monovalent"
    t.decimal  "primer_internal_wt_end_qual"
    t.decimal  "primer_internal_wt_gc_percent_gt"
    t.decimal  "primer_internal_wt_gc_percent_lt"
    t.decimal  "primer_internal_wt_hairpin_th"
    t.decimal  "primer_internal_wt_library_mishyb"
    t.decimal  "primer_internal_wt_num_ns"
    t.decimal  "primer_internal_wt_self_any"
    t.decimal  "primer_internal_wt_self_any_th"
    t.decimal  "primer_internal_wt_self_end"
    t.decimal  "primer_internal_wt_self_end_th"
    t.decimal  "primer_internal_wt_seq_qual"
    t.decimal  "primer_internal_wt_size_gt"
    t.decimal  "primer_internal_wt_size_lt"
    t.decimal  "primer_internal_wt_tm_gt"
    t.decimal  "primer_internal_wt_tm_lt"
    t.integer  "primer_liberal_base"
    t.integer  "primer_lib_ambiguity_codes_consensus"
    t.integer  "primer_lowercase_masking"
    t.integer  "primer_max_end_gc"
    t.decimal  "primer_max_end_stability"
    t.decimal  "primer_max_gc"
    t.decimal  "primer_max_hairpin_th"
    t.decimal  "primer_max_library_mispriming"
    t.integer  "primer_max_ns_accepted"
    t.integer  "primer_max_poly_x"
    t.decimal  "primer_max_self_any"
    t.decimal  "primer_max_self_any_th"
    t.decimal  "primer_max_self_end"
    t.decimal  "primer_max_self_end_th"
    t.integer  "primer_max_size"
    t.decimal  "primer_max_template_mispriming"
    t.decimal  "primer_max_template_mispriming_th"
    t.decimal  "primer_max_tm"
    t.integer  "primer_min_3_prime_overlap_of_junction"
    t.integer  "primer_min_5_prime_overlap_of_junction"
    t.integer  "primer_min_end_quality"
    t.decimal  "primer_min_gc"
    t.integer  "primer_min_left_three_prime_distance"
    t.integer  "primer_min_quality"
    t.integer  "primer_min_right_three_prime_distance"
    t.integer  "primer_min_size"
    t.integer  "primer_min_three_prime_distance"
    t.decimal  "primer_min_tm"
    t.string   "primer_mispriming_library"
    t.integer  "primer_num_return"
    t.decimal  "primer_opt_gc_percent"
    t.integer  "primer_opt_size"
    t.decimal  "primer_opt_tm"
    t.decimal  "primer_outside_penalty"
    t.decimal  "primer_pair_max_compl_any"
    t.decimal  "primer_pair_max_compl_any_th"
    t.decimal  "primer_pair_max_compl_end"
    t.decimal  "primer_pair_max_compl_end_th"
    t.decimal  "primer_pair_max_diff_tm"
    t.decimal  "primer_pair_max_library_mispriming"
    t.decimal  "primer_pair_max_template_mispriming"
    t.decimal  "primer_pair_max_template_mispriming_th"
    t.decimal  "primer_pair_wt_compl_any"
    t.decimal  "primer_pair_wt_compl_any_th"
    t.decimal  "primer_pair_wt_compl_end"
    t.decimal  "primer_pair_wt_compl_end_th"
    t.decimal  "primer_pair_wt_diff_tm"
    t.decimal  "primer_pair_wt_io_penalty"
    t.decimal  "primer_pair_wt_library_mispriming"
    t.decimal  "primer_pair_wt_product_size_gt"
    t.decimal  "primer_pair_wt_product_size_lt"
    t.decimal  "primer_pair_wt_product_tm_gt"
    t.decimal  "primer_pair_wt_product_tm_lt"
    t.decimal  "primer_pair_wt_pr_penalty"
    t.decimal  "primer_pair_wt_template_mispriming"
    t.decimal  "primer_pair_wt_template_mispriming_th"
    t.integer  "primer_pick_anyway"
    t.integer  "primer_pick_internal_oligo"
    t.integer  "primer_pick_left_primer"
    t.integer  "primer_pick_right_primer"
    t.decimal  "primer_product_max_tm"
    t.decimal  "primer_product_min_tm"
    t.integer  "primer_product_opt_size"
    t.decimal  "primer_product_opt_tm"
    t.string   "primer_product_size_range"
    t.integer  "primer_quality_range_max"
    t.integer  "primer_quality_range_min"
    t.integer  "primer_salt_corrections"
    t.decimal  "primer_salt_divalent"
    t.decimal  "primer_salt_monovalent"
    t.integer  "primer_sequencing_accuracy"
    t.integer  "primer_sequencing_interval"
    t.integer  "primer_sequencing_lead"
    t.integer  "primer_sequencing_spacing"
    t.string   "primer_task"
    t.integer  "primer_thermodynamic_oligo_alignment"
    t.string   "primer_thermodynamic_parameters_path"
    t.integer  "primer_thermodynamic_template_alignment"
    t.integer  "primer_tm_formula"
    t.decimal  "primer_wt_end_qual"
    t.decimal  "primer_wt_end_stability"
    t.decimal  "primer_wt_gc_percent_gt"
    t.decimal  "primer_wt_gc_percent_lt"
    t.decimal  "primer_wt_hairpin_th"
    t.decimal  "primer_wt_library_mispriming"
    t.decimal  "primer_wt_num_ns"
    t.decimal  "primer_wt_pos_penalty"
    t.decimal  "primer_wt_self_any"
    t.decimal  "primer_wt_self_any_th"
    t.decimal  "primer_wt_self_end"
    t.decimal  "primer_wt_self_end_th"
    t.decimal  "primer_wt_seq_qual"
    t.decimal  "primer_wt_size_gt"
    t.decimal  "primer_wt_size_lt"
    t.decimal  "primer_wt_template_mispriming"
    t.decimal  "primer_wt_template_mispriming_th"
    t.decimal  "primer_wt_tm_gt"
    t.decimal  "primer_wt_tm_lt"
    t.datetime "created_at",                              :null => false
    t.datetime "updated_at",                              :null => false
  end

  add_index "primer3s", ["batch_detail_id"], :name => "index_primer3s_on_batch_detail_id"
  add_index "primer3s", ["user_id"], :name => "index_primer3s_on_user_id"

  create_table "primer_pairs", :force => true do |t|
    t.integer  "primer3_parameter_id"
    t.integer  "ranking"
    t.string   "cosmic_mut_id"
    t.boolean  "left_seq_selected"
    t.boolean  "right_seq_selected"
    t.text     "modified_left_sequence"
    t.text     "modified_right_sequence"
    t.decimal  "primer_pair_penalty"
    t.decimal  "primer_left_penalty"
    t.decimal  "primer_right_penalty"
    t.text     "primer_left_sequence"
    t.text     "primer_right_sequence"
    t.string   "primer_left"
    t.string   "primer_right"
    t.decimal  "primer_left_tm"
    t.decimal  "primer_right_tm"
    t.decimal  "primer_left_gc_percent"
    t.decimal  "primer_right_gc_percent"
    t.decimal  "primer_left_self_any_th"
    t.decimal  "primer_right_self_any_th"
    t.decimal  "primer_left_self_end_th"
    t.decimal  "primer_right_self_end_th"
    t.decimal  "primer_left_hairpin_th"
    t.decimal  "primer_right_hairpin_th"
    t.decimal  "primer_left_end_stability"
    t.decimal  "primer_right_end_stability"
    t.decimal  "primer_pair_compl_any_th"
    t.decimal  "primer_pair_compl_end_th"
    t.integer  "primer_pair_product_size"
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
  end

  add_index "primer_pairs", ["primer3_parameter_id"], :name => "index_primer_pairs_on_primer3_parameter_id"

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.integer  "resource_id"
    t.string   "resource_type"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "roles", ["name", "resource_type", "resource_id"], :name => "index_roles_on_name_and_resource_type_and_resource_id"
  add_index "roles", ["name"], :name => "index_roles_on_name"

  create_table "stanford_csv", :id => false, :force => true do |t|
    t.text "gene"
    t.text "mutation_aa"
    t.text "mutation_cds"
    t.text "cosmic_mut_id"
  end

  create_table "tests", :force => true do |t|
    t.string   "str",        :default => "0"
    t.datetime "created_at",                  :null => false
    t.datetime "updated_at",                  :null => false
  end

  create_table "texts", :force => true do |t|
    t.string   "xxx"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "name"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "users_roles", :id => false, :force => true do |t|
    t.integer "user_id"
    t.integer "role_id"
  end

  add_index "users_roles", ["user_id", "role_id"], :name => "index_users_roles_on_user_id_and_role_id"

  create_table "vogelstein_tmp", :id => false, :force => true do |t|
    t.text "gene"
    t.text "gene_name"
    t.text "source"
    t.text "genetic_alteration"
    t.text "classification"
  end

  create_table "vogelsteins", :force => true do |t|
    t.string   "gene"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
