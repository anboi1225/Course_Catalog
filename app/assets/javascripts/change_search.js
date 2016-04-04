var string1 = "<h2>Here Comes a Sail Boat</h2>";

function js_test(theId, newHTML) {
  console.log(document.getElementById(theId).innerHTML);
  document.getElementById(theId).innerHTML = newHTML;
}

function search_change() {
  $("#search_form").submit();
}
