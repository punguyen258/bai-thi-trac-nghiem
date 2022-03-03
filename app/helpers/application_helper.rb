module ApplicationHelper

  def full_title page_title = ""                     
    base_title = I18n.t "helper.subjects.title"  
    page_title.empty? ? base_title  : page_title + " | " + base_title
  end

  def link_to_add_fields(name, f, association)
    new_object = f.object.send(association).klass.new
    id = new_object.object_id
    fields = f.fields_for(association, new_object, child_index: id) do |builder|
      render(association.to_s.singularize + "_fields", f: builder)
    end
    link_to name, '#', class: "add_fields", data: {id: id, fields: fields.gsub("\n", "")}
  end
end
