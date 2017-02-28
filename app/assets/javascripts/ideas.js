
// Instead of showing the idea and description as in the wireframe, have the description be hidden at the start and then when you click the title it slides out the description. Clicking the title again should slide in the idea.
// Make clicking New Idea open a modal (you can use Bootstrap Modal if you'd like) instead of taking you to a new page.

$(document).ready(function() {
  $('.description').hide();

  $('.idea .idea-title').click(function() {
    const $description = $(this).closest('.idea').find('a');
    $description.slideToggle(300);
  });
});

// $description.slideToggle(300, function() {
//   $(this).toggleClass('hidden');
// })//.toggleClass('hidden');








//
