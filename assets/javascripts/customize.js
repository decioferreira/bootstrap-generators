window.bootstrapLess = document.getElementById('bootstrap-less').innerHTML;

$(function() {
  $("input").change(function(e) {
    var oldVariable = new RegExp("@" + $(e.target).attr('name') + ":\s*.+;"),
      newVariable = "@" + $(e.target).attr('name') + ": " + $(e.target).val() + ";",
      newStyle = $("<style type='text/less'>" + bootstrapLess.replace(oldVariable, newVariable) + "</style>");
    $("head").append(newStyle);
    less.refreshStyles();
  });
});
