<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <script src="https://cdn.jsdelivr.net/npm/fullcalendar@6.0.2/index.global.min.js"></script>


<style>

    html, body {
      margin: 0;
      padding: 0;
      font-family: Arial;
	  font-size: 14px;
    }

    #calendar {
      max-width: 700px;
      margin: 40px auto;
    }
    
    

  </style>
  
<script>

      document.addEventListener('DOMContentLoaded', function() {
        var calendarEl = document.getElementById('calendar');
        console.log(${result});
        var calendar = new FullCalendar.Calendar(calendarEl, {
          initialView: 'dayGridMonth',
          timeZone: 'UTC',
       	  events:${result},
        });
        calendar.render();
      });
      
      

    </script>

<title>#### 내 스케줄 ####</title>
</head>
<body>
<%@ include file="include/leftBar.jsp" %>
<%@ include file="include/rightBar.jsp" %>
<br><br><br>
  <div id='calendar' style="position: relative; z-index: 5; "></div>
  
<%@ include file="include/footer.jsp" %>  
</body>
</html>