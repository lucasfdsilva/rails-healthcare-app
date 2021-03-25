document.addEventListener("turbolinks:load", function() {
	console.log("Patients Custom JS File Loaded Successfuly")

	$inputPatient = $('*[id="patientInput"]')

  	var options = {
  		getValue: "name",
	    url: function(phrase) {
	      return "/look.json?q=" + phrase;
	    },
	    categories: [
	    	{
	    		listLocation: "patients",
	    		header: "<strong>Patients</strong",
	    	}
	    ],
	    list:{
	    	onChooseEvent: function() {
	    		var patientID = $inputPatient.getSelectedItemData().user_id

	    		if(patientID){
	    			document.getElementById("patientID").value = patientID;
	    		}
	    		
	    	}
	    }
  	};

  	$inputPatient.easyAutocomplete(options);
});

  	

