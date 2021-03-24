document.addEventListener("turbolinks:load", function() {
	console.log("People Custom JS File Loaded Successfuly")

	$input = $('*[data-behavior="autocomplete"]')
	$inputDoctor = $('*[id="doctorInput"]')

  	var options = {
	    url: function(phrase) {
	      return "/search.json?q=" + phrase;
	    },
	    getValue: "name",
	    list:{
	    	onChooseEvent: function() {
	    		var userID = $input.getSelectedItemData().user_id
	    		var doctorID = $inputDoctor.getSelectedItemData().user_id

	    		document.getElementById("doctorID").value = doctorID;
	    	}
	    }
  	};

  	$input.easyAutocomplete(options);
});

  	

