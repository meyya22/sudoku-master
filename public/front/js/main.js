// Common Variables >>

var messages = {
    success: {
        validate: "Great! Your answers are correct.",
        feasible: "Great! Given puzzle can be solved.",
        saveGrid: "Great! Given puzzle has been saved."
    },
    error: {
        validate: "Sorry! Your answers are incorrect.",
        feasible: "Sorry! Given puzzle can't be solved.",
        saveGrid: "Sorry! Given puzzle can't be saved.",
        somethingWentWrong: "Sorry! Something went wrong."
    }
};

// Common Variables <<

// Common Functions >>

function clearNotification() {
    $("#notificationMessage").removeClass();
    $("#notificationMessage").text("");
}

function showNotification(flag, text) {
    clearNotification();
    $("#notificationMessage").addClass(flag ? "success" : "error");
    $("#notificationMessage").text(text);
    $("#notificationMessage").show();
    hideNotification();
}

function hideNotification() {
    setTimeout(function() {
        $("#notificationMessage").hide();
    }, 5000);
}

function setGridValues(response) {
    if (
        response["data"] !== undefined &&
        response["data"]["solution"] !== undefined
    ) {
        for (var i = 0; i < response["data"]["solution"].length; i++) {
            $("#block" + i).val(response["data"]["solution"][i]);
        }
    }
}

// Common Functions <<
