<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String[] abcd = {"A", "B", "C", "D"};
    pageContext.setAttribute("abcd", abcd);
    pageContext.setAttribute("i", 0);
%> 
<div class="sidebar">
    <div id="score10" class="score text-center">1000000$</div>
    <div id="score9" class="score text-center">500000$</div>
    <div id="score8" class="score text-center">200000$</div>
    <div id="score7" class="score text-center">100000$</div>
    <div id="score6" class="score text-center">50000$</div>
    <div id="score5" class="score text-center">10000$</div>
    <div id="score4" class="score text-center">5000$</div>
    <div id="score3" class="score text-center">1000$</div>
    <div id="score2" class="score text-center">500$</div>
    <div id="score1" class="score text-center">100$</div>
</div>
<script>
    if(${not empty answered}){
        for(i=1; i<=${q.getId()}; i++)
            $("#score"+i).addClass("correct-score");
    }
    else {
        
        for(i=1; i<${q.getId()}; i++){
            $("#score"+i).addClass("correct-score");
        }
        $("#score"+${q.getId()}).addClass("score-active");
    }
</script>
<div class="content">
        <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <img id="logoInGame" src="images/logo.png"/>
                    </div>
                    <div class="col-md-12 question text-center">
                        ${q.getText()}
                    </div>
                </div>
                <div class="row">
                    
                    <c:forEach items="${al}" var="answer">
                        <div class="col-md-6">
                            <a href="${contextRoot}/newservlet?qId=${q.getId()}&id=${answer.getId()}&correct=${q.getAnswerId()}" class="answ_a"><button id="${answer.getId()}" class="answer text-center">${abcd[i]}: ${answer.getText()}</button></a>
                            ${i=i+1}
                        </div>
                    </c:forEach>
                    <c:if test="${not empty answered}">
                        <script>
                            
                            $(".answer").addClass("disabled_a");
                            $(".answ_a").addClass("disabled_a");

                            <c:if test="${not empty incorrect}">
                                $("#" + ${incorrect}).addClass("incorrect");
                                $("#score"+${q.getId()}).addClass("incorrect-score");
                            </c:if>
                            $("#" + ${correct}).addClass("correct");
                        </script>
                        <div class="col-md-12">
                            <c:choose>
                                <c:when test="${not empty incorrect}">
                                    <a href="${contextRoot}"><button class="answer text-center next">Back</button></a>
                                    <span class=" text-center pity">YOU LOST!</span>
                                </c:when>
                                <c:otherwise>
                                    <a href="${contextRoot}/newservlet?qId=${q.getId()+1}"><button class="answer text-center next">Next Question</button></a>
                                </c:otherwise>
                            </c:choose>
                        </div>
                    </c:if>
                </div>
        </div>
</div>
