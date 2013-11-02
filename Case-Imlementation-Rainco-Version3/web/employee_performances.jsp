

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<html>
    <head>



        <style type="text/css">


            body {
                font-size: 16px;
            }

            /* the div that holds the date picker calendar */
            .dpDiv {
            }


            /* the table (within the div) that holds the date picker calendar */
            .dpTable {

                font-size: 12px;
                text-align: center;
                color: #505050;
                background-color: #ece9d8;
                border: 1px solid #AAAAAA;
            }


            /* a table row that holds date numbers (either blank or 1-31) */
            .dpTR {
            }


            /* the top table row that holds the month, year, and forward/backward buttons */
            .dpTitleTR {
            }


            /* the second table row, that holds the names of days of the week (Mo, Tu, We, etc.) */
            .dpDayTR {
            }


            /* the bottom table row, that has the "This Month" and "Close" buttons */
            .dpTodayButtonTR {
            }


            /* a table cell that holds a date number (either blank or 1-31) */
            .dpTD {
                border: 1px solid #ece9d8;
            }


            /* a table cell that holds a highlighted day (usually either today's date or the current date field value) */
            .dpDayHighlightTD {
                background-color: #CCCCCC;
                border: 1px solid #AAAAAA;
            }


            /* the date number table cell that the mouse pointer is currently over (you can use contrasting colors to make it apparent which cell is being hovered over) */
            .dpTDHover {
                background-color: #aca998;
                border: 1px solid #888888;
                cursor: pointer;
                color: red;
            }


            /* the table cell that holds the name of the month and the year */
            .dpTitleTD {
            }


            /* a table cell that holds one of the forward/backward buttons */
            .dpButtonTD {
            }


            /* the table cell that holds the "This Month" or "Close" button at the bottom */
            .dpTodayButtonTD {
            }


            /* a table cell that holds the names of days of the week (Mo, Tu, We, etc.) */
            .dpDayTD {
                background-color: #CCCCCC;
                border: 1px solid #AAAAAA;
                color: white;
            }


            /* additional style information for the text that indicates the month and year */
            .dpTitleText {
                font-size: 12px;
                color: gray;
                font-weight: bold;
            }


            /* additional style information for the cell that holds a highlighted day (usually either today's date or the current date field value) */ 
            .dpDayHighlight {
                color: 4060ff;
                font-weight: bold;
            }


            /* the forward/backward buttons at the top */
            .dpButton {

                font-size: 10px;
                color: gray;
                background: #d8e8ff;
                font-weight: bold;
                padding: 0px;
            }


            /* the "This Month" and "Close" buttons at the bottom */
            .dpTodayButton {

                font-size: 10px;
                color: gray;
                background: #d8e8ff;
                font-weight: bold;
            }
            /* CSS Document */

        </style>
        
        <script src="js/calendar.js"></script>
<script src="js/details.js"></script>
        
        
    </head>
    <body>


        <p>To Date
            <input name="ADate" id="ADate"> 
        <input type=button value="select" onclick="displayDatePicker('ADate')">	<p>

        <p>From Date
            <input name="YetAnotherDate" id="YetAnotherDate"> 
         <input type=button value="select" onclick="displayDatePicker('YetAnotherDate')">


            <input type="button" value="Click" onclick="view_performance()">

            <br/>




    </body>

  
</html>
