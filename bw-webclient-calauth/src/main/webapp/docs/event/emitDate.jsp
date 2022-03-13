<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix="c" %>
<%@ taglib uri='bedework' prefix='bw' %>
      <%-- All date/time information below is in "local" time --%>
      <bw:emitText name="date" property="dateType"
                   tagName="allday" /><%--
        Value: true/false --%>
      <bw:emitText name="date" property="floating"/>
      <bw:emitText name="date" property="utc"/><%--
        Value: true or false --%>
      <bw:emitText name="date" property="utcDate"
                   tagName="utcdate" /><%--
        Value: yyyymmdd - date value --%>
      <bw:emitText name="date" property="unformatted"/><%--
        Value: yyyymmdd - date value --%>

      <c:set var="fmtdate" value="${date.formatted}" />

      <bw:emitText name="fmtdate" property="year"/><%--
        Value: yyyy - year value --%>
      <bw:emitText name="fmtdate" property="fourDigitYear"
                   tagName="fourdigityear"/><%--
        Value: yyyy - four digit year value.  --%>
      <bw:emitText name="fmtdate" property="month"/><%--
        Value: m - single or two digit month value --%>
      <bw:emitText name="fmtdate" property="twoDigitMonth"
                   tagName="twodigitmonth"/><%--
        Value: mm - two digit month value --%>
      <bw:emitText name="fmtdate" property="monthName"
                   tagName="monthname"/><%--
        Value (example): January - full month name --%>
      <bw:emitText name="fmtdate" property="day"/><%--
        Value: d - single or two digit day value --%>
      <bw:emitText name="fmtdate" property="dayName"
                   tagName="dayname"/><%--
        Value (example): Monday - full day name --%>
      <bw:emitText name="fmtdate" property="twoDigitDay"
                   tagName="twodigitday"/><%--
        Value: dd - two digit day value --%>
      <bw:emitText name="fmtdate" property="hour24"/><%--
        Value: h - single to two digit 24 hour value (0-23) --%>
      <bw:emitText name="fmtdate" property="twoDigitHour24"
                   tagName="twodigithour24"/><%--
        Value: hh - two digit 24 hour value (00-23) --%>
      <bw:emitText name="fmtdate" property="hour"/><%--
        Value: h - single to two digit hour value (0-12) --%>
      <bw:emitText name="fmtdate" property="twoDigitHour"
                   tagName="twodigithour"/><%--
        Value: hh - two digit hour value (00-12) --%>
      <bw:emitText name="fmtdate" property="minute"/><%--
        Value: m - single to two digit minute value (0-59) --%>
      <bw:emitText name="fmtdate" property="twoDigitMinute"
                   tagName="twodigitminute"/><%--
        Value: mm - two digit minute value (00-59) --%>
      <bw:emitText name="fmtdate" property="amPm"
                   tagName="ampm"/><%--
        Value: am,pm --%>
      <bw:emitText name="fmtdate" property="longDateString"
                   tagName="longdate"/><%--
        Value (example): February 8, 2004 - long representation of the date --%>
      <bw:emitText name="fmtdate" property="dateString"
                   tagName="shortdate"/><%--
        Value (example): 2/8/04 - short representation of the date --%>
      <bw:emitText name="fmtdate" property="timeString"
                   tagName="time"/><%--
        Value (example): 10:15 PM - representation of the time --%>
      <timezone>
        <bw:emitText name="date" property="tzid"
                     tagName="id"/>
        <bw:emitText name="date" property="tzIsLocal"
                     tagName="islocal"/>
        <logic:equal name="date" property="tzIsLocal" value="false">
          <c:set var="tzdate" value="${date.tzFormatted}" />

          <bw:emitText name="tzdate" property="date"/>
          <bw:emitText name="tzdate" property="year"/>
          <bw:emitText name="tzdate" property="fourDigitYear"
                       tagName="fourdigityear"/>
          <bw:emitText name="tzdate" property="month"/>
          <bw:emitText name="tzdate" property="twoDigitMonth"
                       tagName="twodigitmonth"/>
          <bw:emitText name="tzdate" property="monthName"
                       tagName="monthname"/>
          <bw:emitText name="tzdate" property="day"/>
          <bw:emitText name="tzdate" property="dayName"
                       tagName="dayname"/>
          <bw:emitText name="tzdate" property="twoDigitDay"
                       tagName="twodigitday"/>
          <bw:emitText name="tzdate" property="hour24"/>
          <bw:emitText name="tzdate" property="twoDigitHour24"
                       tagName="twodigithour24"/>
          <bw:emitText name="tzdate" property="hour"/>
          <bw:emitText name="tzdate" property="twoDigitHour"
                       tagName="twodigithour"/>
          <bw:emitText name="tzdate" property="minute"/>
          <bw:emitText name="tzdate" property="twoDigitMinute"
                       tagName="twodigitminute"/>
          <bw:emitText name="tzdate" property="amPm"
                       tagName="ampm"/>
          <bw:emitText name="tzdate" property="longDateString"
                       tagName="longdate"/>
          <bw:emitText name="tzdate" property="dateString"
                       tagName="shortdate"/>
          <bw:emitText name="tzdate" property="timeString"
                       tagName="time"/>
        </logic:equal>
      </timezone>

