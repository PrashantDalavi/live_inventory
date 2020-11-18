class Product < ActiveRecord::Base

  belongs_to :ware_house

  validates :sku_code, :presence => true,
            :uniqueness => true,
            length: {minimum: 8, maximum: 8}


  def self.import(file) 
    spreadsheet = open_spreadsheet(file)
    header = spreadsheet.row(1)
    products = []
    errors_hash = []
    (2..spreadsheet.last_row).each do |i|
      row = Hash[[header, spreadsheet.row(i)].transpose]
      product = find_by_id(row["id"]) || new
      rowss = {"name"=>row['Name'].to_s,
            "sku_code"=>row['Sku Code'].to_s,
            "price"=>row['Price'].to_i,
            "item_count"=>row['Count'].to_i,
            "low_item_threshold"=>row['Threshold'].to_i,
            "ware_house_id"=>row['Ware House'].to_i}

      product.attributes = rowss
      product.save

      if product.errors.present?
        errors_hash << "row#{i + 2} :   #{product.errors.full_messages.join(", ")}"
      end

    end  
    return errors_hash
  end

  def self.open_spreadsheet(file)
    case File.extname(file.original_filename)
      when ".csv" then Roo::Csv.new(file.path, file_warning: :ignore)
      when ".xls" then Roo::Excel.new(file.path , file_warning: :ignore)
      when ".xlsx" then Roo::Excelx.new(file.path , file_warning: :ignore)
      else raise "Unknown file type: #{file.original_filename}"
    end
  end

end
