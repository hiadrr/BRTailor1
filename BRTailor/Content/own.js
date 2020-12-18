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
                   var collorsize = document.getElementById("CollorSize").value;
                   var bottom = document.getElementById("Bottom").value;
                   var sidepockets = document.getElementById("SidePocket").value;
                   var frontpockets = document.getElementById("FrontPocket").value;
                 //new
                   var hip = document.getElementById("Hip").value;
                   var gidrii = document.getElementById("Gidrii").value;
                   var crossback = document.getElementById("CrossBack").value;
                   var tera = document.getElementById("Tera").value;
                   var dcollor = document.getElementById("Dcollor").value;
                   var ghera = document.getElementById("Ghera").value;
                   var Gheranum = document.getElementById("Ghera_num").value;
                   var Comments = document.getElementById("Comments").value;
                   var suitdesign = document.getElementById("suitDesign").value;
                   var btndesign = document.getElementById("btnDesign").value;
                   var stitch = document.getElementById("Stitch").value;
                   var coatbutton = document.getElementById("CoatButton").value;
                   var coatfitting = document.getElementById("CoatFitting").value;
     



                   Measurlist.push({
                       Measurment_Type_ID: $('#Measurment_Type_ID').val().trim(),
                       Measurment_Type: $('#Measurment_Type').val().trim(),
                       Length: $('#Length').val().trim(),
                       Chest:  $('#Chest').val().trim(),
                       Shoulder:$('#Shoulder').val().trim(),
                       Waist: $('#Waist').val().trim(),
                       Sleeves: $('#Sleeves').val().trim(),
                       arms: $('#arms').val().trim(),
                       Collor: $('#CollorSize').val().trim(),
                       Bottom:$('#Bottom').val().trim(),
                       SidePocket: $('#SidePocket').val().trim(),
                       FrontPocket: $('#FrontPocket').val().trim(),

                       Hip: $('#Hip').val().trim(),
                       Gidrii: $('#Gidrii').val().trim(),
                       CrossBack: $('#CrossBack').val().trim(),
                       Tera: $('#Tera').val().trim(),
                       Dcollor: $('#Dcollor').val().trim(),
                       suitDesign: $('#suitDesign').val().trim(),
                       Ghera: $('#Ghera').val().trim(),
                       Ghera_num: $('#Ghera_num').val().trim(),
                       Comments: $('#Comments').val().trim(),
                       btnDesign: $('#btnDesign').val().trim(),
                       Stitch: $('#Stitch').val().trim(),
                       CoatButton: $('#CoatButton').val().trim(),
                       CoatFitting: $('#CoatFitting').val().trim()
                

                   });
                   var rows = "<tr>"
                   + "<td class='prtoducttd' >" + type + "</td>"
                   + "<td class='prtoducttd' >" + length + "</td>"
                     + "<td class='prtoducttd' >" + arms + "</td>"
                     + "<td class='prtoducttd' >" + tera + "</td>"
                      + "<td class='prtoducttd' >" + collorsize + "</td>"
                   + "<td class='prtoducttd'>" + chest + "</td>"
                    + "<td class='prtoducttd'>" + waist + "</td>"
                     + "<td class='prtoducttd'>" + ghera + "</td>"
                       + "<td class='prtoducttd' >" + sleeves + "</td>"
                  + "<td class='prtoducttd' >" + shoulder + "</td>"
                     + "<td class='prtoducttd' >" + hip + "</td>"
                   + "<td class='prtoducttd' >" + gidrii + "</td>"
                   + "<td class='prtoducttd' >" + bottom + "</td>"
                  + "<td class='prtoducttd'>" + Gheranum + "</td>"
                   + "<td class='prtoducttd' >" + dcollor + "</td>"
                    + "<td class='prtoducttd' >" + sidepockets + "</td>"
                   + "<td class='prtoducttd' >" + frontpockets + "</td>"
                  + "<td class='prtoducttd' >" + suitdesign + "</td>"
                   + "<td class='prtoducttd'>" + btndesign + "</td>"
                     + "<td class='prtoducttd' >" + stitch + "</td>"
                    + "<td class='prtoducttd'>" + coatbutton + "</td>"
                  + "<td class='prtoducttd' >" + coatfitting + "</td>"
                    + "<td class='prtoducttd'>" + crossback + "</td>"
                    
                   
                 
                 
                 
                   
                   + "</tr>";
                   $('#tblMeasur tbody').append(rows);

                   //Clear fields
                   $('#Measurment_Type_ID').val('').focus();
                   $('#Hip').val('');
                   $('#Measurment_Type').val('');
                   $('#Gidrii').val('');
                   $('#Ghera_num').val('');
                   $('#Comments').val(''); 
                   $('#CrossBack').val('');
                   $('#Waist').val('');
                   $('#FrontPocket').val('');
                   $('#suitDesign').val('');
                   $('#Length').val('');
                   $('#Dcollor').val('');
                   $('#Tera').val('');
                   $('#Ghera').val('');
                   $('#btnDesign').val('');
                   $('#CoatFitting').val('');
                   $('#Shoulder').val('');
                   $('#arms').val('');
                   $('#Bottom').val('');
                   $('#Stitch').val('');
                   $('#CoatButton').val('');
                   $('#Chest').val('');
                   $('#Waist').val('');
                   $('#Sleeves').val('');
                   $('#CollorSize').val('');
                   $('#SidePocket').val('');
                   $('#Waist').val('');
                   $('#Sleeves').val('');
             

               }

              function Save() {
                  var data = {
                      CustomerID: $('#CustomerID').val().trim(),
                      CustomerName: $('#CustomerName').val().trim(),
                      Phone: $('#Phone').val().trim(),
                      City: $('#City').val().trim(),
                      Address: $('#Address').val().trim(),
                      measurments: Measurlist
                              }
                   $.ajax({
                       url: '/Customer/Insertdata',
                       type: "POST",
                       data: JSON.stringify(data),
                       dataType: "JSON",
                       contentType: "application/json",
                       success: function (d) {
                           //check is successfully save to database
                           if (d.status == true) {
                               //clear form
                               Measurlist = [];
                               $('#CustomerID,#CustomerName,#Ghera_num,#Comments,#Phone,#City,#Address,#Hipdiv,#Gidriidiv,#CrossBackdiv,#Waistdiv,#Teradiv,#Dcollordiv,#Gheradiv,#suitDesigndiv,#btnDesigndiv,#Stitchdiv,#CoatButtondiv,#CoatFittingdiv,#Lengthdiv,#Lengthdiv,#Chestdiv,#Shoulderdiv,#Waistdiv,#Sleevesdiv,#armsdiv,#CollorSizediv,#Bottomdiv,#SidePocketdiv,#FrontPocketdiv,#type').val('');
                              
                               $('#tblMeasur tbody').remove();

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
           
              function Customer() {
                  var Search = document.getElementById("searchc").value;

                  if (Search != "") {
                      $.ajax({
                          url: '/Customer/SearchCustomer',
                          type: "POST",
                          data: { Search: Search },

                      }).then(function (res) {
                          $("#modelBody").html(res);
                          if ($("#checkModelNull").val() == '0') {
                              $("#btnFIlldata").hide();
                          }
                          else {
                              $("#btnFIlldata").show();
                          }
                          $("#SearchPatient").modal();

                      }).fail(function (res) {
                          console.log(res);
                      });


                  }
                     

                  
              }
              function FillData() {
                  $("#CustomerID").val($("#SCustomer_ID").val());
                  $("#CustomerName").val($("#SCustomer").val());
                  $("#Phone").val($("#SPhone").val());
                  $("#City").val($("#SCity").val());
                  $("#Address").val($("#SAddress").val());




                  $("#SearchPatient").modal('hide');
              }