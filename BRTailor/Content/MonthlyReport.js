$(document).ready(function () {
   

    $(".DateRange").datepicker();

 

});
function PrintReportSummary()
{
    var FromDate = $("#FromDate").val();
    var ToDate = $("#ToDate").val();
    

    var url = "/Admin/PtintMonthlySales?FromDate=" + FromDate + "&ToDate=" + ToDate;
    Print(url);

}
function PrintReportSummarybyitem() {
    var FromDate = $("#FromDate").val();
    var ToDate = $("#ToDate").val();
    var drpCategory = $("#Measurment_Type").val();

    var url = "/Admin/ReportByitem?FromDate=" + FromDate + "&ToDate=" + ToDate + "&drpCategory=" + drpCategory;
    Print(url);

}

function PrintStaffSummary() {
    var FromDate = $("#FromDate").val();
    var ToDate = $("#ToDate").val();


    var url = "/Admin/PtintMonthlyStaff?FromDate=" + FromDate + "&ToDate=" + ToDate;
    Print(url);
}
function PrintStaffSummarybyitem() {
    var FromDate = $("#FromDate").val();
    var ToDate = $("#ToDate").val();
    var drpCategory = $("#Measurment_Type").val();

    var url = "/Admin/StaffByitem?FromDate=" + FromDate + "&ToDate=" + ToDate + "&drpCategory=" + drpCategory;
    Print(url);

}
function PrintStaffAccount() {
    var FromDate = $("#FromDate").val();
    var ToDate = $("#ToDate").val();
    var drpCategory = $("#Measurment_Type").val();

    var url = "/Admin/StaffAccount?FromDate=" + FromDate + "&ToDate=" + ToDate + "&drpCategory=" + drpCategory;
    Print(url);

}

function Print(url) {
    var win = window.open(url, '_blank');
    win.focus();


}

