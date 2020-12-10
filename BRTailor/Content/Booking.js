var Measurlist = [];
function add() {

    var typeid = document.getElementById("Measurment_Type_ID").value;
    var price = document.getElementById("Price").value;
    var designid = document.getElementById("Design_ID").value;
    var designnewid = document.getElementById("Design_IDnew").value;
    var dprice = document.getElementById("D_Price").value;
    var dcode = document.getElementById("DesignCodeName").value
    var itemname = document.getElementById("Measurment_Type").value;


    Measurlist.push({
        Measurment_Type_ID: $('#Measurment_Type_ID').val().trim(),
        Price: $('#Price').val().trim(),
        Design_ID: $('#Design_ID').val().trim(),
        Design_IDnew: $('#Design_IDnew').val().trim(),
        D_Price: $('#D_Price').val().trim(),
        D_Code: $('#DesignCodeName').val().trim(),
        DesignCodeName: $('#DesignCodeName').val().trim(),
        Measurment_Type: $('#Measurment_Type').val().trim(),
    });
    var rows = "<tr>"
    + "<td class='prtoducttd'>" + itemname + "</td>"
    + "<td class='prtoducttd'>" + price + "</td>"
    + "<td class='prtoducttd'>" + dcode + "</td>"
     + "<td class='prtoducttd' >" + dprice + "</td>"
    + "</tr>";
    $('#tblMeasur tbody').append(rows);

    //Clear fields
    $('#Measurment_Type_ID').val('').focus();
    $('#Price').val('');
    $('#Design_ID').val('');
    $('#Design_IDnew').val('');
    $('#D_Price').val('');
    $('#Measurment_Type').val('');
    $('#DesignCodeName').val('');

}

function Save() {
    var data = {
        Customer_ID: $('#Customer_ID').val().trim(),
        Customer_Name: $('#Customer_Name').val().trim(),
        Customer_Phone: $('#Customer_Phone').val().trim(),
        Customer_City: $('#Customer_City').val().trim(),
        Customer_Address: $('#Customer_Address').val().trim(),
        Total: $('#Total').val().trim(),
        Discount: $('#Discount').val().trim(),
        bookingItem: Measurlist
    }
    $.ajax({
        url: '/Booking/BookOrder        ',
        type: "POST",
        data: JSON.stringify(data),
        dataType: "JSON",
        contentType: "application/json",
        success: function (data) {
            window.location.href = data;
        },
        error: function (data) {
            window.location.href = data;
            $('#submit').val('Save');
        }
    });

}
