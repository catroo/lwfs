# -*- coding: utf-8 -*-

def glob(filter, ignored_pattern = nil)
  ignored_pattern = /(^|\/)[,#]/ if ignored_pattern.nil?
  entries = []
  if filter.kind_of?(Array)
    filter = filter.map{|e| e.encode(Encoding::UTF_8)}
  else
    filter = filter.encode(Encoding::UTF_8)
  end
  Dir.glob(filter).each do |e|
    if RbConfig::CONFIG['host_os'].downcase =~ /darwin/
      e.encode!(Encoding::UTF_8, Encoding::UTF_8_MAC)
    end
    entries.push(e) unless e =~ ignored_pattern
  end
  entries.sort
end
