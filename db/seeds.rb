require 'csv'

# puts 'Deleting Current Data'
# Politican.destroy_all
# Committee.destroy_all
# IndividualDonation.destroy_all
# CandCommLinking.destroy_all
# CommitteeTransfer.destroy_all
# IndependentExpenditure.destroy_all
# OperationCost.destroy_all
County.destroy_all
ZipCode.destroy_all

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

# puts 'Fixing Committee Party Markings'
# (1..8).each do |i|
#     puts "#{i} loop through, #{Committee.where(comm_party: '').count} still dont have a party"
#     Committee
#         .search('*', where: { comm_party: '' }, scroll: '1m')
#         .scroll do |batch|
#             batch.each do |c|
#                 party_amount = Hash.new
#                 c
#                     .committee_sent_transfers
#                     .includes(:committee)
#                     .each do |comt|
#                         unless comt.committee.nil?
#                             if party_amount.has_key? comt.committee.comm_party
#                                 party_amount[comt.committee.comm_party] += 1
#                             else
#                                 party_amount[comt.committee.comm_party] = 1
#                             end
#                         end
#                     end
#                 key_val = party_amount.max_by { |k, v| v }
#                 unless key_val.nil?
#                     if key_val[0] != ''
#                         c.comm_party = key_val[0]
#                         c.save
#                     end
#                 end
#             end
#         end
# end

# (1..4).each do |i|
#     puts "#{i} loop through, #{Committee.where(comm_party: '').count} still dont have a party"
#     Committee
#         .search('*', where: { comm_party: '' }, scroll: '1m')
#         .scroll do |batch|
#             batch.each do |c|
#                 party_amount = Hash.new
#                 c
#                     .committee_sent_transfers
#                     .includes(:committee)
#                     .each do |comt|
#                         unless comt.committee.nil?
#                             if party_amount.has_key? comt.committee.comm_party
#                                 party_amount[comt.committee.comm_party] += 1
#                             else
#                                 party_amount[comt.committee.comm_party] = 1
#                             end
#                         end
#                     end
#                 key_val = party_amount.except('').max_by { |k, v| v }
#                 unless key_val.nil?
#                     if key_val[0] != ''
#                         c.comm_party = key_val[0]
#                         c.save
#                     end
#                 end
#             end
#         end
# end

puts 'Creating counties and zips'

%w[ZIP-COUNTY-FIPS_2017-06.csv].each do |file|
    p file
    csv_text = File.read(Rails.root.join('db', 'Data', 'ZipCodes', file))
    csv = csv_text.split("\n")
    csv.each do |row|
        split_row = row.split(',')

        County.create(
            fids: split_row[3],
            name: split_row[1],
            state: split_row[2],
            total_donated: 0.0,
            dem_donation: 0.0,
            rep_donation: 0.0,
            other_donation: 0.0,
            total_donated_org: 0.0,
            dem_donation_org: 0.0,
            rep_donation_org: 0.0,
            other_donation_org: 0.0,
            total_donated_com: 0.0,
            dem_donation_com: 0.0,
            rep_donation_com: 0.0,
            other_donation_com: 0.0,
        )
    end
end

%w[us-county-boundaries.csv].each do |file|
    p file
    table = CSV.parse(File.read(Rails.root.join('db', 'Data', 'ZipCodes', file)), headers: true)
    table.each do |row|
        begin
            c = County.find(row[2].to_s)
            if !!c
                c.log = row[0].split(', ')[0].to_f
                c.lat = row[0].split(', ')[1].to_f
                c.save
            end
        rescue => exception
            p exception
        end
    end
end

%w[ZIP-COUNTY-FIPS_2017-06.csv].each do |file|
    p file
    csv_text = File.read(Rails.root.join('db', 'Data', 'ZipCodes', file))
    csv = csv_text.split("\n")
    csv.each do |row|
        split_row = row.split(',')

        ZipCode.create(
            zip: split_row[0],
            county_id: split_row[3],
            total_donated: 0.0,
            dem_donation: 0.0,
            rep_donation: 0.0,
            other_donation: 0.0,
            total_donated_org: 0.0,
            dem_donation_org: 0.0,
            rep_donation_org: 0.0,
            other_donation_org: 0.0,
            total_donated_com: 0.0,
            dem_donation_com: 0.0,
            rep_donation_com: 0.0,
            other_donation_com: 0.0,
        )
    end
end

puts 'Totaling ammounts'
count = ZipCode.count
ZipCode.all.each_with_index do |zc, ind|
    begin
        p "#{ind} out of #{count} zipcodes"

        if zc.total_donated.zero?
            dem_zip = 0.0
            rep_zip = 0.0
            total_zip = 0.0

            dem_zip_com = 0.0
            rep_zip_com = 0.0
            total_zip_com = 0.0

            dem_zip_org = 0.0
            rep_zip_org = 0.0
            total_zip_org = 0.0

            IndividualDonation
                .search(zc.zip, fields: [{ zip: :exact }], select: [:amount], includes: [:committee], scroll: '1m')
                .scroll do |batch|
                    batch.each do |item|
                        if %w[CCM COM PAC].include? item.entity_type
                            dem_zip_com += item.amount if item.committee.comm_party == 'DEM'
                            rep_zip_com += item.amount if item.committee.comm_party == 'REP'
                            total_zip_com += item.amount
                        elsif %w[PTY ORG].include? item.entity_type
                            dem_zip_org += item.amount if item.committee.comm_party == 'DEM'
                            rep_zip_org += item.amount if item.committee.comm_party == 'REP'
                            total_zip_org += item.amount
                        else
                            dem_zip += item.amount if item.committee.comm_party == 'DEM'
                            rep_zip += item.amount if item.committee.comm_party == 'REP'
                            total_zip += item.amount
                        end
                    end
                end
            zc.total_donated = total_zip
            zc.dem_donation = dem_zip
            zc.rep_donation = rep_zip
            zc.other_donation = total_zip - (dem_zip + rep_zip)

            zc.total_donated_com = total_zip_com
            zc.dem_donation_com = dem_zip_com
            zc.rep_donation_com = rep_zip_com
            zc.other_donation_com = total_zip_com - (dem_zip_com + rep_zip_com)

            zc.total_donated_org = total_zip_org
            zc.dem_donation_org = dem_zip_org
            zc.rep_donation_org = rep_zip_org
            zc.other_donation_org = total_zip_org - (dem_zip_org + rep_zip_org)
            zc.save
        end
    rescue => exception
        p exception
    end
end

count = County.count
County.all.each_with_index do |c, ind|
    begin
        p "#{ind} out of #{count} counties"

        # if c.total_donated.zero?
        c.total_donated = c.zip_codes.sum(:total_donated)
        c.dem_donation = c.zip_codes.sum(:dem_donation)
        c.rep_donation = c.zip_codes.sum(:rep_donation)
        c.other_donation = c.zip_codes.sum(:other_donation)

        c.total_donated_com = c.zip_codes.sum(:total_donated_com)
        c.dem_donation_com = c.zip_codes.sum(:dem_donation_com)
        c.rep_donation_com = c.zip_codes.sum(:rep_donation_com)
        c.other_donation_com = c.zip_codes.sum(:other_donation_com)

        c.total_donated_org = c.zip_codes.sum(:total_donated_org)
        c.dem_donation_org = c.zip_codes.sum(:dem_donation_org)
        c.rep_donation_org = c.zip_codes.sum(:rep_donation_org)
        c.other_donation_org = c.zip_codes.sum(:other_donation_org)
        c.save
        # end
    rescue => exception
        p exception
    end
end
