require 'roo'

namespace :import do
  desc "Import data from spreadsheet"
  task data: :environment do
    puts 'Importing Data'

    data = Roo::Spreadsheet.open('lib/Orders_details.xlsx') # open spreadsheet
    XlsxImportService.new(data).import

    puts 'Data Imported!'
  end
end
