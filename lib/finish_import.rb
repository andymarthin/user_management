class FinishImport
  # def on_success(_status, options)
  #   import_id = options['import_id']
  #   import = Import.find_by(id: import_id)

  #   import.completed!
  # end
  def on_complete(status, _options)
    puts 'Uh oh, batch has failures' if status.failures != 0
  end

  def on_success(_status, options)
    puts "#{options['uid']}'s batch succeeded.  Kudos!"
    import_id = options['import_id']
    import = Import.find_by(id: import_id)

    import.completed!
  end
end
