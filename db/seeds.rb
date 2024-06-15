require "csv"
# 実行方法: rails db:seed

filepaths = %w(
  /db/seeds/services.csv
)

filepaths.each do |filepath|
  # Rails.root のパスは環境によって異なる
  path = "#{Rails.root}#{filepath}"
  filename = File.basename(path, ".csv")
  namespace_path = path.gsub(Rails.root.join('db/seeds').to_s, '').gsub("/#{filename}.csv", '').gsub(/^\//, '')
  namespace = namespace_path.split('/').map(&:classify).join('::')
  namespaced_model_name = "#{namespace}::#{filename.classify}" unless namespace.empty?
  model = Module.const_get(namespaced_model_name || filename.classify)
  data = CSV.read(path, headers: true).map(&:to_h)
  return if data.blank?
  model.upsert_all(data, unique_by: :id) # rubocop:disable Rails/SkipsModelValidations
  Rails.logger.debug { "DONE. file: #{filename}, Model: #{model}" }
end
