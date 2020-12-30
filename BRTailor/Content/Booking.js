var Measurlist = [];
var TotalAmount = 0;
var Payable = 0;

function add() {
    sPrice
    var typeid = document.getElementById("Measurment_Type_ID").value;
    var sprice = document.getElementById("sPrice").value;
    var sName = document.getElementById("sName").value;
    var price = document.getElementById("Price").value;
    var quantity = document.getElementById("textQuantity").value;
    var designid = document.getElementById("Design_ID").value;
    var designnewid = document.getElementById("Design_IDnew").value;
    var dprice = document.getElementById("D_Price").value;
    var dcode = document.getElementById("DesignCodeName").value
    var itemname = document.getElementById("Measurment_Type").value;
    


    Measurlist.push({
        Measurment_Type_ID: $('#Measurment_Type_ID').val().trim(),
        Price: $('#Price').val().trim(),
        sPrice: $('#sPrice').val().trim(),
        sName: $('#sName').val().trim(),
        Quantity: $('#textQuantity').val().trim(),
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
     + "<td class='prtoducttd'>" + sName + "</td>"
     + "<td class='prtoducttd'>" + sprice + "</td>"
       + "<td class='prtoducttd'>" + quantity + "</td>"
    + "</tr>";
    $('#tblMeasur tbody').append(rows);
    
    if (dprice === "")
    {
        dprice = "0";
    }
    if (sprice === "") {
        sprice = "0";
    }
    if (price === "") {
        price = "0";
    }
    var eachprice = (parseInt(price) + parseInt(dprice) +  parseInt(sprice)) * parseInt(quantity);
    TotalAmount = TotalAmount + parseInt(eachprice);
        $("#Total").val(TotalAmount);
        $("#Payable").val(TotalAmount);
    

    //Clear fields
    $('#Measurment_Type_ID').val('').focus();
    $('#Price').val('');
    $('#Design_ID').val('');
    $('#Design_IDnew').val('');
    $('#D_Price').val('');
    $('#Measurment_Type').val('');
    $('#DesignCodeName').val('');

}

function CalculateDiscountPerce() {
    var d = $("#Discount").val();
    if (d === "") {
         d = "0";
    }
    Payable = TotalAmount - d;
    $("#Payable").val(Payable);
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
        Payable: $('#Payable').val().trim(),
  
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
function SavePrint() {
    var data = {
        Print : 'Yes',
        Customer_ID: $('#Customer_ID').val().trim(),
        Customer_Name: $('#Customer_Name').val().trim(),
        Customer_Phone: $('#Customer_Phone').val().trim(),
        Customer_City: $('#Customer_City').val().trim(),
        Customer_Address: $('#Customer_Address').val().trim(),
        Total: $('#Total').val().trim(),
        Discount: $('#Discount').val().trim(),
        Payable: $('#Payable').val().trim(),

        bookingItem: Measurlist
    }
    $.ajax({
        url: '/Booking/BookOrder        ',
        type: "POST",
        data: JSON.stringify(data),
        dataType: "JSON",
        contentType: "application/json",
        success: function (data) {
            window.open(window.location.href = data, '_blank');
            

        },
        error: function (data) {
            window.location.href = data;
            $('#submit').val('Save');
        }
    });

}
function Print(url) {
    var win = window.open(url, '_blank');
    win.focus();


}