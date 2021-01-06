
var AllServiceObj = [];
var TotalAmount = 0;
var Payable = 0;

function addservices() {
    var itemname = document.getElementById("Measurment_Type").value;
   
}
function add() {
   
    var quantity = document.getElementById("textQuantity").value;
    var serviceObj = $("#drpServies").val();
    serviceObj = JSON.parse(serviceObj);
    serviceObj.ServiceName = serviceObj.ServiceName;
    serviceObj.ServicePrice = serviceObj.Price * quantity;
    serviceObj.Quantity = quantity;
    serviceObj.S_ID = serviceObj.S_ID;
    var html = "<tr id='Row_" + serviceObj.S_ID + "' ><td>" + serviceObj.ServiceName + "</td><td>" + serviceObj.Price + "</td><td>" + serviceObj.Quantity + " </td><td style=''><button data-id = " + serviceObj.S_ID + "  class='btn btn-sm green delegate btn-outline filter-submit' ><i class='fa fa-close'></i></button></td></tr>";
    $("#TblServices").append(html);
    AllServiceObj.push(serviceObj);
    
    
    TotalAmount = TotalAmount + parseInt(serviceObj.ServicePrice);
    $("#Total").val(TotalAmount);
    $("#Payable").val(TotalAmount);
    

    
    $('#textQuantity').val('');
    $('#drpServies').val('');

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
        //servicelist: Service,
        bookingItem: AllServiceObj
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
        //servicelist: Service,
        bookingItem: AllServiceObj
    }
    $.ajax({
        url: '/Booking/BookOrder        ',
        type: "POST",
        data: JSON.stringify(data),
        dataType: "JSON",
        contentType: "application/json",
        success: function (data) {
            window.open(data, '_blank');
           

        },
        error: function (data) {
            window.location.href = data;
            $('#submit').val('Save');
        }
    });

}
function Print(url) {
    
    var win = window.open(url, '_blank');
    location.reload();
    
   
}

$("body").on("click", ".delegate", function (event) {
    event.preventDefault();
    var Id = $(this).attr('data-id')
    RemoveServiceRow(Id);
});
function RemoveServiceRow(Id) {
    $("#Row_" + Id).remove();
    var ServiceIndex = AllServiceObj.map(function (item) { return item.S_ID; }).indexOf(parseInt(Id));
    var ServicePrice = AllServiceObj[ServiceIndex].ServicePrice;
    if (TotalAmount >= parseFloat(ServicePrice)) {
        TotalAmount = TotalAmount - parseFloat(ServicePrice);

        $("#Total").val(TotalAmount);
        $("#Payable").val(TotalAmount);
    }
    AllServiceObj.splice(ServiceIndex, 1);
}
