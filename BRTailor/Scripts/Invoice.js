$(document).ready(function () {
    $("#btnLoadReport").click(function () {
        ReportManager.LoadReport();

    });

    var ReprotManager = {
        LoadReport: function () {
            var jsonParam = "";
            var serviceUrl = "../Employee/GenerateEmployeeReport";
            ReprotManager.GetReport(serviceUrl, jsonParam, onFailed);
            function onFailed(error)
            { alert("Error Found"); }

        },
        GetReport: function (serviceUrl, jsonParam, errorCallback) {
            jQuery.ajax({
                url: serviceUrl,
                async: false,
                type: "POST",
                data: "{" + jsonParam + "}",
                contentType: "application/Json; Charset=utf-8",
                success: function () {
                    window.open('../Report/ReportViewer.aspx', '_newtab');
                }
            });
        }
    };
});