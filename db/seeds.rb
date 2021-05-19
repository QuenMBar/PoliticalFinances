# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts 'Deleting Current Data'
Politican.destroy_all

puts 'Loading Politicians'

%w[weball22.csv weball20.csv].each do |file|
    csv_text = File.read(Rails.root.join('db', 'Data', 'Canidates', file))
    csv = csv_text.split("\n")
    csv.each do |row|
        split_row = row.split('|')
        p = Politican.find_by(cand_id: split_row[0])
        if !p
            p = Politican.new
            p.cand_id = split_row[0]
            p.cand_name = split_row[1]
            p.cand_party = split_row[4]
            p.ttl_receipts = split_row[5].to_f
            p.trans_from_committees = split_row[6].to_f
            p.ttl_payments = split_row[7].to_f
            p.trans_to_committees = split_row[8].to_f
            p.init_cash = split_row[9].to_f
            p.end_cash = split_row[10].to_f
            p.cand_contribute = split_row[11].to_f
            p.loans = split_row[12].to_f + split_row[13].to_f
            p.repaid_loans = split_row[14].to_f + split_row[15].to_f
            p.debts = split_row[16].to_f
            p.indiv_contribute = split_row[17].to_f
            p.cand_state = split_row[18]
            p.cand_dist = split_row[19]
            p.other_committee_con = split_row[25]
            p.party_committee_con = split_row[26]
            p.indiv_refund = split_row[28]
            p.committee_refund = split_row[29]
            p.save
        else
            p.ttl_receipts += split_row[5].to_f
            p.trans_from_committees += split_row[6].to_f
            p.ttl_payments += split_row[7].to_f
            p.trans_to_committees += split_row[8].to_f
            p.init_cash = split_row[9].to_f if p.init_cash > split_row[9].to_f
            p.end_cash = split_row[10].to_f if p.end_cash < split_row[10].to_f
            p.cand_contribute += split_row[11].to_f
            p.loans += split_row[12].to_f + split_row[13].to_f
            p.repaid_loans += split_row[14].to_f + split_row[15].to_f
            p.debts += split_row[16].to_f
            p.indiv_contribute += split_row[17].to_f
            p.other_committee_con += split_row[25].to_f
            p.party_committee_con += split_row[26].to_f
            p.indiv_refund += split_row[28].to_f
            p.committee_refund += split_row[29].to_f
            p.save
        end
    end
end
