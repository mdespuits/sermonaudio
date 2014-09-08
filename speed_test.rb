require 'benchmark/ips'

def mapping_conversion(key)
  key.to_s.split('_')
     .map { |v| v.downcase == 'id' ? v.upcase : v.capitalize }
     .join
end

def double_map(key)
  key.to_s.split('_')
     .map(&:upcase)
     .map { |word| word.capitalize if word == 'Id' }
     .join
end

Benchmark.ips do |x|
  x.report("Mapping Conversion") do
    mapping_conversion(:member_id)
  end

  x.report("Double Map Conversion") do
    double_map(:member_id)
  end
  x.compare!
end
