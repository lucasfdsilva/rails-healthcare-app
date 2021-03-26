document.addEventListener("turbolinks:load", function() {
	console.log("People Custom JS File Loaded Successfuly")

	$input = $('*[data-behavior="autocomplete"]')
	$inputDoctor = $('*[id="doctorInput"]')

  	var options = {
  		getValue: "name",
	    url: function(phrase) {
	      return "/search.json?q=" + phrase;
	    },
	    categories: [
	    	{
	    		listLocation: "doctors",
	    		header: "<strong>Doctors</strong",
	    	},
	    	{
	    		listLocation: "users",
	    		header: "<strong>Users</strong",
	    	},
	    	{
	    		listLocation: "prescriptions",
	    		header: "<strong>Prescriptions</strong",
	    	}
	    ],
	    list:{
	    	onChooseEvent: function() {
	    		var userID = $input.getSelectedItemData().user_id
	    		var doctorID = $inputDoctor.getSelectedItemData().user_id

	    		if(doctorID){
	    			document.getElementById("doctorID").value = doctorID;
	    		}
	    		
	    	}
	    }
  	};

  	$input.easyAutocomplete(options);
});

  	

