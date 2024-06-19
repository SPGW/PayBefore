module VaultsHelper
  def vault_icon(vault)
    case vault.name
    when "Housing"
      content_tag(:i, "", class: "fa-solid fa-people-roof fa-2xl")
    when "Education"
      content_tag(:i, "", class: "fa-solid fa-school fa-2xl")
    else
      content_tag(:i, "", class: "fa-solid fa-hand-holding-medical fa-2xl")
    end
  end
end
