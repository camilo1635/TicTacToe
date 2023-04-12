&lt;%@ taglib uri=&quot;http://java.sun.com/jsp/jstl/core&quot; prefix=&quot;c&quot; %&gt;

&lt;%@page import=&quot;game.GameBean.GameState&quot; %&gt;
&lt;%@page import=&quot;game.Cell&quot; %&gt;
&lt;%@page import=&quot;game.Line&quot; %&gt;

&lt;jsp:useBean id=&quot;gameBean&quot; scope=&quot;session&quot; class=&quot;game.GameBean&quot; /&gt;

&lt;%@page contentType=&quot;text/html&quot; pageEncoding=&quot;UTF-8&quot;%&gt;
&lt;!DOCTYPE html&gt;
&lt;html&gt;
&lt;head&gt;
&lt;meta http-equiv=&quot;Content-Type&quot; content=&quot;text/html; charset=UTF-8&quot;&gt;
&lt;title&gt;Tic Tac Toe&lt;/title&gt;
&lt;/head&gt;
&lt;body&gt;
&lt;h1&gt;Tic Tac Toe&lt;/h1&gt;
&lt;table border=&quot;4&quot;&gt;
&lt;c:forEach var=&quot;line&quot; items=&quot;${gameBean.gridLines}&quot;&gt;
&lt;tr&gt;
&lt;c:forEach var=&quot;cell&quot; items=&quot;${gameBean.getGridStatus(line)}&quot;&gt;
&lt;td&gt;
&lt;c:choose&gt;
&lt;c:when test=&quot;${cell.state == &#39;X&#39;}&quot;&gt;
&lt;img src=&quot;img/state_x.png&quot; alt=&quot;X&quot;/&gt;
&lt;/c:when&gt;
&lt;c:when test=&quot;${cell.state == &#39;O&#39;}&quot;&gt;
&lt;img src=&quot;img/state_o.png&quot; alt=&quot;O&quot;/&gt;
&lt;/c:when&gt;
&lt;c:otherwise&gt;
&lt;c:if test=&quot;${winner == null}&quot;&gt;
&lt;a href=&quot;gameServlet?Line=${cell.line}&amp;Col=${cell.col}&quot;&gt;
&lt;/c:if&gt;
&lt;img src=&quot;img/state_null.png&quot; alt=&quot;null&quot;/&gt;
&lt;c:if test=&quot;${winner == null}&quot;&gt;
&lt;/a&gt;
&lt;/c:if&gt;
&lt;/c:otherwise&gt;
&lt;/c:choose&gt;
&lt;/td&gt;
&lt;/c:forEach&gt;
&lt;/tr&gt;
&lt;/c:forEach&gt;
&lt;/table&gt;
&lt;c:if test=&quot;${winner != null}&quot;&gt;
&lt;h2&gt;${winner} Won!&lt;/h1&gt;
&lt;form action=&quot;index.jsp&quot; method=&quot;post&quot;&gt;
&lt;input type=&quot;submit&quot; name=&quot;Replay&quot; value=&quot;Play again&quot;&gt;&lt;br/&gt;
&lt;/form&gt;
&lt;/c:if&gt;

&lt;/body&gt;
&lt;/html&gt;l>