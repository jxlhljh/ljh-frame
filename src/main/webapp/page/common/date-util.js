/*
 * date-util.js
 */

/**
 * 得到当前年月
 *
 * @Parameter separator
 *              日期格式分隔符：‘-’或者‘/’
 *
 * @return: 当前年月
 *              根据传入的分隔符来决定返回值：
 *                  ‘-’则返回：YYYY-MM
 *                  ‘/’则返回：MM/YYYY
 */
function getCurrentMonthDate(separator) {
    var today = new Date();

    var month = today.getMonth() + 1;
    var year = today.getFullYear();

    month = parseInt(month) < 10 ? '0' + month : month;

    if (separator == '-') {
        return year + '-' + month;
    }

    if (separator == '/') {
        return month + '/' + year;
    }
}

/**
 * 得到当前年月日
 *
 * @Parameter separator
 *              日期格式分隔符：‘-’或者‘/’
 *
 * @return: 当前年月日。
 *              根据传入的分隔符来决定返回值：
 *                  ‘-’则返回：YYYY-MM-DD
 *                  ‘/’则返回：DD/MM/YYYY
 */
function getCurrentDate(separator) {
    var today = new Date();

    var day = today.getDate();
    var month = today.getMonth() + 1;
    var year = today.getFullYear();

    day = parseInt(day) < 10 ? '0' + day : day;
    month = parseInt(month) < 10 ? '0' + month : month;

    if (separator == '-') {
        return year + '-' + month + '-' + day;
    }

    if (separator == '/') {
        return day + '/' + month + '/' + year;
    }
}

/**
 * 验证日期格式是否正确
 *
 * @parammeter: date
 *              待验证的日期
 *              类型：string
 *              格式：YYYY-MM-DD或者DD/MM/YYYY
 *
 * @parammeter: separator
 *              日期格式的分隔符：‘-’或者‘/’
 *
 * @return: 如果是正确的日期格式则返回true；否则返回false
 */
function isRightFormat(date, separator) {
    var re;

    if (separator == '-') {
        re = new RegExp('(([0-9]{3}[1-9]|[0-9]{2}[1-9][0-9]{1}|[0-9]{1}[1-9][0-9]{2}|[1-9][0-9]{3})-(((0[13578]|1[02])-(0[1-9]|[12][0-9]|3[01]))|((0[469]|11)-(0[1-9]|[12][0-9]|30))|(02-(0[1-9]|[1][0-9]|2[0-8]))))|((([0-9]{2})(0[48]|[2468][048]|[13579][26])|((0[48]|[2468][048]|[3579][26])00))-02-29)');
    } else if (separator == '/') {
        re = new RegExp('(((0[1-9]|[12][0-9]|3[01])/((0[13578]|1[02]))|((0[1-9]|[12][0-9]|30)/(0[469]|11))|(0[1-9]|[1][0-9]|2[0-8])/(02))/([0-9]{3}[1-9]|[0-9]{2}[1-9][0-9]{1}|[0-9]{1}[1-9][0-9]{2}|[1-9][0-9]{3}))|(29/02/(([0-9]{2})(0[48]|[2468][048]|[13579][26])|((0[48]|[2468][048]|[3579][26])00)))');
    } else {
        return false;
    }

    if (re.exec(date) != null) {
        return true;
    } else {
        return false;
    }
}

/**
 * 比较开始日期是否 <= 结束日期
 *
 * @parammeter: startDate
 *              开始日期
 *              类型：string
 *              格式：YYYY-MM-DD或者DD/MM/YYYY
 *
 * @parammeter: endDate
 *              结束日期
 *              类型：string
 *              格式：YYYY-MM-DD或者DD/MM/YYYY
 *
 * @return: startDate <= endDate返回true；startDate > endDate或者参数格式错误则返回false
 */
function compare(startDate, endDate) {
    var separator;
    var startD;
    var endD;

    if (startDate.indexOf('-') != -1 && endDate.indexOf('-') != -1) {
        separator = '-';

        if (isRightFormat(startDate, separator) && isRightFormat(endDate, separator)) {
            startD = new Date(Date.parse(startDate.replace('-', '/')));
            endD = new Date(Date.parse(endDate.replace('-', '/')));
        } else {
            return false;
        }
    } else if (startDate.indexOf('/') != -1 && endDate.indexOf('/') != -1) {
        separator = '/';

        if (isRightFormat(startDate, separator) && isRightFormat(endDate, separator)) {
            startD = new Date(Date.parse(startDate));
            endD = new Date(Date.parse(endDate));
        } else {
            return false;
        }
    } else {
        return false;
    }

    return (startD <= endD);
}