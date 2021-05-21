# puts 'Deleting Current Data'
# Politican.destroy_all
# Committee.destroy_all
# IndividualDonation.destroy_all
# CandCommLinking.destroy_all
# CommitteeTransfer.destroy_all
# IndependentExpenditure.destroy_all
# OperationCost.destroy_all

# puts 'Loading Committees and Pacs'

# %w[cm22.csv cm20.csv].each do |file|
#     p file
#     csv_text = File.read(Rails.root.join('db', 'Data', 'Committees', file))
#     csv = csv_text.split("\n")
#     csv.each do |row|
#         split_row = row.split('|')
#         c = Committee.find_by(comm_id: split_row[0])
#         if !c
#             c =
#                 Committee.create(
#                     id: split_row[0],
#                     comm_name: split_row[1],
#                     comm_address: "#{split_row[3]}, #{split_row[5]}, #{split_row[6]}, #{split_row[7]}",
#                     comm_zip: split_row[7].to_i,
#                     comm_des: split_row[8],
#                     comm_type: split_row[9],
#                     comm_party: split_row[10],
#                     comm_cat: split_row[12],
#                     org_name: split_row[13],
#                 )
#         end
#     end
# end

# %w[webk20.csv webk22.csv].each do |file|
#     p file
#     csv_text = File.read(Rails.root.join('db', 'Data', 'Committees', file))
#     csv = csv_text.split("\n")
#     csv.each do |row|
#         split_row = row.split('|')
#         c = Committee.find_by(comm_id: split_row[0])
#         if !c
#             c = Committee.new
#             c.comm_id = split_row[0]
#             c.comm_name = split_row[1]
#             c.comm_des = split_row[3]
#             c.comm_type = split_row[2]
#             c.ttl_receipts = split_row[5].to_f
#             c.trans_from_affiliates = split_row[6].to_f
#             c.trans_from_other_committees = split_row[8].to_f
#             c.indiv_contribute = split_row[7].to_f
#             c.ttl_payments = split_row[12].to_f
#             c.loans = split_row[11].to_f
#             c.repaid_loans = split_row[17].to_f
#             c.trans_to_affiliates = split_row[13].to_f
#             c.indiv_refund = split_row[14].to_f
#             c.committee_refund = split_row[15].to_f
#             c.init_cash = split_row[18].to_f
#             c.end_cash = split_row[19].to_f
#             c.debts = split_row[20].to_f
#             c.trans_nf = split_row[21].to_f
#             c.trans_to_other_committees = split_row[22].to_f
#             c.ind_exp = split_row[23].to_f
#             c.party_exp = split_row[24].to_f
#             c.nf_exp = split_row[25].to_f
#             c.save
#         else
#             if c.ttl_receipts.nil?
#                 c.ttl_receipts = split_row[5].to_f
#                 c.trans_from_affiliates = split_row[6].to_f
#                 c.trans_from_other_committees = split_row[8].to_f
#                 c.indiv_contribute = split_row[7].to_f
#                 c.ttl_payments = split_row[12].to_f
#                 c.loans = split_row[11].to_f
#                 c.repaid_loans = split_row[17].to_f
#                 c.trans_to_affiliates = split_row[13].to_f
#                 c.indiv_refund = split_row[14].to_f
#                 c.committee_refund = split_row[15].to_f
#                 c.init_cash = split_row[18].to_f
#                 c.end_cash = split_row[19].to_f
#                 c.debts = split_row[20].to_f
#                 c.trans_nf = split_row[21].to_f
#                 c.trans_to_other_committees = split_row[22].to_f
#                 c.ind_exp = split_row[23].to_f
#                 c.party_exp = split_row[24].to_f
#                 c.nf_exp = split_row[25].to_f
#                 c.save
#             else
#                 c.ttl_receipts += split_row[5].to_f
#                 c.trans_from_affiliates += split_row[6].to_f
#                 c.trans_from_other_committees += split_row[8].to_f
#                 c.indiv_contribute += split_row[7].to_f
#                 c.ttl_payments += split_row[12].to_f
#                 c.loans += split_row[11].to_f
#                 c.repaid_loans += split_row[17].to_f
#                 c.trans_to_affiliates += split_row[13].to_f
#                 c.indiv_refund += split_row[14].to_f
#                 c.committee_refund += split_row[15].to_f
#                 c.init_cash = split_row[18].to_f if c.init_cash > split_row[18].to_f
#                 c.end_cash = split_row[19].to_f if c.end_cash < split_row[19].to_f
#                 c.debts += split_row[20].to_f
#                 c.trans_nf += split_row[21].to_f
#                 c.trans_to_other_committees += split_row[22].to_f
#                 c.ind_exp += split_row[23].to_f
#                 c.party_exp += split_row[24].to_f
#                 c.nf_exp += split_row[25].to_f
#                 c.save
#             end
#         end
#     end
# end

# puts 'Loading Politicians'

# %w[weball22.csv weball20.csv].each do |file|
#     p file
#     csv_text = File.read(Rails.root.join('db', 'Data', 'Canidates', file))
#     csv = csv_text.split("\n")
#     csv.each do |row|
#         split_row = row.split('|')
#         p = Politican.find_by(cand_id: split_row[0])
#         if !p
#             p = Politican.new
#             p.cand_id = split_row[0]
#             p.cand_name = split_row[1]
#             p.cand_party = split_row[4]
#             p.ttl_receipts = split_row[5].to_f
#             p.trans_from_committees = split_row[6].to_f
#             p.ttl_payments = split_row[7].to_f
#             p.trans_to_committees = split_row[8].to_f
#             p.init_cash = split_row[9].to_f
#             p.end_cash = split_row[10].to_f
#             p.cand_contribute = split_row[11].to_f
#             p.loans = split_row[12].to_f + split_row[13].to_f
#             p.repaid_loans = split_row[14].to_f + split_row[15].to_f
#             p.debts = split_row[16].to_f
#             p.indiv_contribute = split_row[17].to_f
#             p.cand_state = split_row[18]
#             p.cand_dist = split_row[19]
#             p.other_committee_con = split_row[25]
#             p.party_committee_con = split_row[26]
#             p.indiv_refund = split_row[28]
#             p.committee_refund = split_row[29]
#             p.save
#         else
#             p.ttl_receipts += split_row[5].to_f
#             p.trans_from_committees += split_row[6].to_f
#             p.ttl_payments += split_row[7].to_f
#             p.trans_to_committees += split_row[8].to_f
#             p.init_cash = split_row[9].to_f if p.init_cash > split_row[9].to_f
#             p.end_cash = split_row[10].to_f if p.end_cash < split_row[10].to_f
#             p.cand_contribute += split_row[11].to_f
#             p.loans += split_row[12].to_f + split_row[13].to_f
#             p.repaid_loans += split_row[14].to_f + split_row[15].to_f
#             p.debts += split_row[16].to_f
#             p.indiv_contribute += split_row[17].to_f
#             p.other_committee_con += split_row[25].to_f
#             p.party_committee_con += split_row[26].to_f
#             p.indiv_refund += split_row[28].to_f
#             p.committee_refund += split_row[29].to_f
#             p.save
#         end
#     end
# end

# %w[cn20.csv cn22.csv].each do |file|
#     p file
#     csv_text = File.read(Rails.root.join('db', 'Data', 'Canidates', file))
#     csv = csv_text.split("\n")
#     csv.each do |row|
#         split_row = row.split('|')
#         p = Politican.find_by(cand_id: split_row[0])
#         if !p
#             p = Politican.new
#             p.cand_id = split_row[0]
#             p.cand_name = split_row[1]
#             p.cand_party = split_row[2]
#             p.elec_year = split_row[3].to_i
#             p.cand_state = split_row[4]
#             p.cand_office = split_row[5]
#             p.cand_dist = split_row[6]
#             p.cand_status = split_row[8]
#             p.committee_id = split_row[9]
#             p.camp_address = "#{split_row[10]}, #{split_row[12]}, #{split_row[13]}, #{split_row[14]}"
#             p.zip = split_row[14].to_i
#             p.save
#         else
#             p.elec_year = split_row[3].to_i
#             p.cand_state = split_row[4]
#             p.cand_office = split_row[5]
#             p.cand_dist = split_row[6]
#             p.cand_status = split_row[8]
#             p.committee_id = split_row[9]
#             p.camp_address = "#{split_row[10]}, #{split_row[12]}, #{split_row[13]}, #{split_row[14]}"
#             p.zip = split_row[14].to_i
#             p.save
#         end
#     end
# end

# puts 'Loading Individual Donations'

# (1..61).each do |num|
#     p "itcont#{num}.csv"
#     begin
#         ActiveRecord::Base.connection.execute(
#             "COPY individual_donations(committee_id, amend_ind, report_type, indicator, image, trans_type, entity_type, name, city, state, zip, employ, occu, date, amount, candidate_id, TRAN_ID, FILE_NUM, MEMO_CD, note, fec_id) FROM '/home/qbeast360/FlatIronSE/FinalProject/PoliticalFinances/db/Data/IndivDonos/itcont#{num}.csv' DELIMITER '|' CSV HEADER;",
#         )
#     rescue => exception
#         p exception
#     end
# end

# puts 'Creating Linking Table'

# %w[ccl20.csv ccl22.csv].each do |file|
#     p file
#     csv_text = File.read(Rails.root.join('db', 'Data', 'Linking', file))
#     csv = csv_text.split("\n")
#     csv.each do |row|
#         split_row = row.split('|')
#         ccl = CandCommLinking.find_by(committee_id: split_row[3], politican_id: split_row[0])
#         if !ccl
#             ccl = CandCommLinking.new
#             ccl.politican_id = split_row[0]
#             ccl.committee_id = split_row[3]
#             ccl.save
#         end
#     end
# end

# puts 'Loading Committee Transfers'

# %w[itoth20.csv itoth22.csv].each do |file|
#     p file
#     begin
#         ActiveRecord::Base.connection.execute(
#             "COPY committee_transfers(committee_id,amndt_ind,rpt_tp,transaction_pgi,image_num,transaction_tp,entity_tp,name,city,state,zip_code,employer,occupation,transaction_dt,transaction_amt,other_id,tran_id,file_num,memo_cd,memo_text,sub_id) FROM '/home/qbeast360/FlatIronSE/FinalProject/PoliticalFinances/db/Data/CommTrans/#{file}' DELIMITER '|' CSV HEADER;",
#         )
#     rescue => exception
#         p exception
#     end
# end

# puts 'Loading Operating Costs'

# %w[oppexp20.csv oppexp22.csv].each do |file|
#     p file
#     begin
#         ActiveRecord::Base.connection.execute(
#             "COPY operation_costs(committee_id,amndt_ind,rpt_yr,rpt_tp,image_num,line_num,form_tp_cd,sched_tp_cd,name,city,state,zip_code,transaction_dt,transaction_amt,transaction_pgi,purpose,category,category_desc,memo_cd,memo_text,entity_tp,sub_id,file_num,tran_id,back_ref_tran_id,empty) FROM '/home/qbeast360/FlatIronSE/FinalProject/PoliticalFinances/db/Data/OppCost/#{file}' DELIMITER '|' CSV HEADER;",
#         )
#     rescue => exception
#         p exception
#     end
# end

# puts 'Loading Independent Expendatures'

# %w[itpas20.csv itpas22.csv].each do |file|
#     p file
#     begin
#         ActiveRecord::Base.connection.execute(
#             "COPY independent_expenditures(committee_id,amndt_ind,rpt_tp,transaction_pgi,image_num,transaction_tp,entity_tp,name,city,state,zip_code,employer,occupation,transaction_dt,transaction_amt,other_id,politican_id,tran_id,file_num,memo_cd,memo_text,sub_id) FROM '/home/qbeast360/FlatIronSE/FinalProject/PoliticalFinances/db/Data/IndepExpend/#{file}' DELIMITER '|' CSV HEADER;",
#         )
#     rescue => exception
#         p exception
#     end
# end
