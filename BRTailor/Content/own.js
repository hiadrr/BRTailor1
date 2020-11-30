        var Measurlist = [];
             function add() {
                   //Add items
                   var type = document.getElementById("Measurment_Type_ID").value;
                   var length = document.getElementById("Length").value;
                   var chest = document.getElementById("Chest").value;
                   var shoulder = document.getElementById("Shoulder").value;
                   var waist = document.getElementById("Waist").value;
                   var sleeves = document.getElementById("Sleeves").value;
                   var arms = document.getElementById("arms").value;
                   var collor = document.getElementById("Collor").value;
                   var bottom = document.getElementById("Bottom").value;
                   var sidepockets = document.getElementById("SidePocket").value;
                   var frontpockets = document.getElementById("FrontPocket").value;
                   Measurlist.push({
                       Measurment_Type_ID: $('#Measurment_Type_ID').val().trim(),
                       Length: $('#Length').val().trim(),
                       Chest:  $('#Chest').val().trim(),
                       Shoulder:$('#Shoulder').val().trim(),
                       Waist: $('#Waist').val().trim(),
                       Sleeves: $('#Sleeves').val().trim(),
                       arms: $('#arms').val().trim(),
                       Collor: $('#Collor').val().trim(),
                       Bottom:$('#Bottom').val().trim(),
                       SidePocket: $('#SidePocket').val().trim(),
                       FrontPocket: $('#FrontPocket').val().trim()

                   });
                   var rows = "<tr>"
                   + "<td class='prtoducttd' id = 'type'>" + type + "</td>"
                   + "<td class='prtoducttd' id = 'length'>" + length + "</td>"
                   + "<td class='prtoducttd' id = 'chest'>" + chest + "</td>"
                    + "<td class='prtoducttd' id = 'shoulder'>" + shoulder + "</td>"
                   + "<td class='prtoducttd' id = 'waist'>" + waist + "</td>"
                   + "<td class='prtoducttd' id = 'sleeves'>" + sleeves + "</td>"
                    + "<td class='prtoducttd' id = 'arms'>" + arms + "</td>"
                   + "<td class='prtoducttd' id = 'collor'>" + collor + "</td>"
                   + "<td class='prtoducttd' id = 'bottom'>" + bottom + "</td>"
                    + "<td class='prtoducttd' id = 'sidepockets'>" + sidepockets + "</td>"
                   + "<td class='prtoducttd' id = 'frontpockets'>" + frontpockets + "</td>"
                   
                   + "</tr>";
                   $('#tblMeasur tbody').append(rows);

                   //Clear fields
                   $('#Measurment_Type_ID').val('').focus();
                   $('#Length,#Chest,#Shoulder,#Waist,#Sleeves,#arms,#Collor,#Institute,#Bottom,#SidePocket,#FrontPocket').val('');

               }

              function Save() {
                   var data = {
                       StudentName: $('#StudentName').val().trim(),
                       Email: $('#Email').val().trim(),
                       FatherName: $('#FatherName').val().trim(),
                       Phone: $('#Phone').val().trim(),
                       Age: $('#Age').val().trim(),
                       City: $('#City').val().trim(),
                       Address: $('#Address').val().trim(),
                       DOB: $('#DOB').val().trim(),
                       Educations: Educationlist
                   }
                   $.ajax({
                       url: '/Student/Insertdata',
                       type: "POST",
                       data: JSON.stringify(data),
                       dataType: "JSON",
                       contentType: "application/json",
                       success: function (d) {
                           //check is successfully save to database
                           if (d.status == true) {
                               //clear form
                               Educationlist = [];
                               $('#StudentName,#Email,#FatherName,#Phone,#Age,#City,#Address,#DOB').val('');
                               $('#deg').remove();
                               $('#y').remove();
                               $('#inst').remove();
                               $('#tblStudent tbody').remove();

                               alert('Successfully done.');
                           }
                           else {
                               alert('Failed');
                           }
                           $('#submit').val('Save');
                       },
                       error: function () {
                           alert('Error. Please try again.');
                           $('#submit').val('Save');
                       }
                   });

               }
     
              