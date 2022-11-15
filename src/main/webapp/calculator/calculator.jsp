<body style="text-align: center;">
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<jsp:useBean id="calcu" class="javabean.CalculateBean"/>
<jsp:setProperty property="*" name="calcu"/>
<%
    try{
        calcu.calculate();
    }catch(Exception e){
        out.write(e.getMessage());
    }
%>

<br/>--------------------------------------------------------------------------------------------<br/>
计算结果是：
<jsp:getProperty property="firstNum" name="calcu"/>
<jsp:getProperty property="operator" name="calcu"/>
<jsp:getProperty property="secondNum" name="calcu"/>
=
<jsp:getProperty property="result" name="calcu"/>
<br/>--------------------------------------------------------------------------------------------<br/>

<br/>

<form action="calculator.jsp" method="post">
    <table width="40%" border="1">
        <tr>
            <td colspan="2">简单的计算器</td>
        </tr>
        <tr>
            <td>第一个参数</td>
            <td>
                <input type="text" name="firstNum">
            </td>
        </tr>

        <tr>
            <td>操作符</td>
            <td>
                <select name="operator" >
                    <option value="+">+</option>
                    <option value="-">-</option>
                    <option value="*">*</option>
                    <option value="/">/</option>
                </select>
            </td>
        </tr>

        <tr>
            <td>第二个参数</td>
            <td>
                <input type="text" name="secondNum">
            </td>
        </tr>

        <tr>
            <td colspan="2">
                <input type="submit" value="计算">
            </td>
        </tr>

    </table>
</form>



</body>