document.addEventListener("turbolinks:load", function() {
	console.log("Doctors Custom JS File Loaded Successfuly")

	$inputDoctor = $('*[id="doctorInput"]')

  	var options = {
  		getValue: "name",
	    url: function(phrase) {
	      return "/find.json?q=" + phrase;
	    },
	    categories: [
	    	{
	    		listLocation: "doctors",
	    		header: "<strong>Doctors</strong",
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

  	$inputDoctor.easyAutocomplete(options);
});

  	

