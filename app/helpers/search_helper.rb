module SearchHelper
  def icon_wrench(key, name)
    "<a href ng-click=\"invokeModal('#{key}', '#{name}')\" ng-class=\"iconWrenchAdditionalClass('#{key}')\" eat-click><i class=\"icon-wrench\"></i></a>".html_safe
  end

  def icon_hide(key)
    "<a href ng-click=\"hideColumn('#{key}')\" eat-click><i class=\"icon-remove\"></i></a>".html_safe
  end

  def params_to_ng(params, fields_names_hash, hidden_fields)
    result = ""
    def ng_init_span(js)
      "<span ng-init=\"#{js}\"></span>"
    end

    params = {'g' => {}} unless params and params['g']
    params['g'].values.each do |group|
      criterias = []
      field = nil
      group['c'].values.each do |criteria|
        field     = criteria['a']['0']['name']
        condition = criteria['p']
        values    = []

        criteria['v'].values.each{ |v| values << "{data: '#{v['value']}'}" }
        criterias << "{condition: '#{condition}', values: [#{values.join(',')}] }"
      end

      type = group['m'].upcase
      result << ng_init_span("fieldsCriterias.push({type: '#{type}', field: '#{field}', field_name: '#{fields_names_hash[field.to_sym]}', criterias: [#{criterias.join(',')}]})")
    end

    return result.html_safe unless hidden_fields
    hidden_fields.each do |field|
      result << ng_init_span("hideColumn('#{field}')")
    end

    result.html_safe
  end
end
