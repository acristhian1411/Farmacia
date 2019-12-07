//= require active_admin/base
//= require activeadmin_addons/all
//= require arctic_admin/base
var toggleManyAdd = function(e) {
  $(e.target).closest(".has_many_container").find("a.has_many_add").toggle();
}

// Adds the toggleManyAdd click handler to the Add and Remove buttons
var initToggleManyAdd = function(){
  $(".has_many a[class*='has_many_']").not(".toggle-many-added").click(toggleManyAdd);
  $(".has_many a[class*='has_many_']").addClass("toggle-many-added");
}
initToggleManyAdd();
$(document).on('has_many_add:after', initToggleManyAdd();)

// Hides the Add button if a `.has-one` element already exists
$(".has_many .has_many_container").each( function(_, container) {
  if($(container).find("ol").length){ $(container).find("a.has_many_add").hide(); }
})
