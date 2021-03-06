<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@page import="com.stardy.service.StudyService" %>
<%@ page import="com.stardy.entity.Study" %>
<%@ page import="java.util.List" %>
<%@ page import="com.stardy.util.CategoryConvert" %>
<%@ page import="com.stardy.controller.study.StudyController" %>
<%@ page import="com.stardy.service.StudyService" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="com.stardy.service.BoardService" %>
<%@ page import="com.stardy.service.LikeService" %>
<%@ page import="com.stardy.entity.Board" %>

<%
    Study study = null;
    StudyController studyController = null;
    StudyService studyService = null;
    BoardService boardService = null;
    List<Board> board = null;
    LikeService likeService = null;
    int id= 0;
    String writer = "";

    try {
        id = Integer.parseInt(request.getParameter("id"));
       	System.out.println(id);
       	writer = request.getParameter("writer");
        studyController = new StudyController();
        boardService = new BoardService();
        likeService = new LikeService();
        study = studyController.getStudy(id);
        board = boardService.getList(id);
        studyService = new StudyService();

    } catch (SQLException throwables) {
        throwables.printStackTrace();
    }


%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../css/reset.css">
    <link rel="stylesheet" href="../css/layout.css">
    <link rel="stylesheet" href="../css/basic.css">
    <link rel="stylesheet" href="../css/header.css">
    <link rel="stylesheet" href="../css/style.css">


    <title>Document</title>
</head>
<body>
    <div class="container">

        <%@include file="/layout/header.jsp" %>


        <aside class="aside">
            <h1 class="hide">aside</h1>
        </aside>


        <section class="jumbotron">
            <h1 class="hide">jumbo</h1>
            <div class="jumbotron-text">
                <div class="title-container">
                    <div class="jumbo-title"><%=study.getTitle()%></div>
                    <div class="jumbo-study-date">
                        <div class="jumbo-icon"></div>
                        <div class="jumbo-date-text"> <%= studyController.getDuringTime(id) %> ?????? ????????? ???</div>
                    </div>
                </div>
                <div class="jumbo-menu">
                    <div class="jumbo-button">
                        <div class="invite-icon"></div>
                        <button type="button">??????</button>
                    </div>
                    <div class="jumbo-button">
                        <div class="setting-icon"></div>
                        <button type="button">??????</button>
                    </div>
                </div>
            </div>
        </section>

        <main class="main">
            <h1 class="hide">main</h1>
            <div class="main-menu">
                <div class="main-button">
                    <div class="hot-icon"></div>
                </div>
                <div class="main-button">
                    <div class="new-icon"></div>
                </div>
                <div class="aside-active-btn">
                    <button class="btn btn-show">=</button>
                    <div class="about-study">
                        <div class="about-study-header">About Study</div>
                        <div class="about-main">
                            <div class="about-study-content"><%=study.getIntro()%></div>
                            <div class="about-study-info">
                                <div class="about-member">
                                    <div class="member-cnt"><%=studyService.getCrnt(study)%></div>
                                    <div class="member-txt">Members</div>
                                </div>
                                <div class="about-posts">
                                    <div class="post-cnt">130</div>
                                    <div class="post-txt">Posts</div>
                                </div>

                            </div>
                            <div class="about-study-create-date">
                                <div class="calender">
                                    <div class="calender-img"></div>
                                    <div class="calender-txt">Created</div>
                                </div>
                                <div class="create-date">2021??? 3??? 31???</div>
                            </div>
                            <div class="about-study-master">
                                <div class="master-img-container">
                                    <div class="master-img"></div>
                                    <div class="master-txt">????????? ?????????</div>
                                </div>
                                <div class="master-name">?????????</div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="write">
                <div class="pencil"></div>
                <input class="write-section" type="text" value="???????????? ??????????????????.">
            </div>

            <ul class="card-list">
                <% for(int i = 0; i < board.size(); i++) {%>
                <li class="card">
                    <div class="up-and-down">
                        <div class="up"><input type="button" style="border:0; background-color:transparent"></div>
                        <div class="recommend-cnt"><%=likeService.count(board.get(i).getId())%></div>
                        <div class="down"><input type="button"></div>
                    </div>
                    <div class="card-content">
                        <div class="profile">
                            <div class="profile-picture"></div>
                            <div class="profile-name"><%=boardService.getWriter(board.get(i).getId())%></div>
                            <div class="date">1h 20m ago</div>
                        </div>
                        <div class="title"><%=board.get(i).getTitle()%></div>
                        <div class="content"><%=board.get(i).getContent()%></div>
                        <div class="etc">
                            <div class="comment">
                                <div class="comment-img"></div>
                                <div class="comment-cnt">2 comments</div>
                            </div>
                            <div class="save">
                                <div class="save-img"></div>
                                <div class="save-txt">save</div>
                            </div>
                        </div>
                    </div>
                </li>
                <%}%>
            </ul>
        </main>

        <aside class="aside">
            <div class="about-study">
                <div class="about-study-header">About Study</div>
                <div class="about-main">
                    <div class="about-study-content"><%=study.getIntro()%></div>
                    <div class="about-study-info">
                        <div class="about-member">
                            <div class="member-cnt"><%=studyService.getCrnt(study)%></div>
                            <div class="member-txt">Members</div>
                        </div>
                        <div class="about-posts">
                            <div class="post-cnt">130</div>
                            <div class="post-txt">Posts</div>
                        </div>

                    </div>
                    <div class="about-study-create-date">
                        <div class="calender">
                            <div class="calender-img"></div>
                            <div class="calender-txt">Created</div>
                        </div>
                        <div class="create-date"><%=study.getRegDate()%></div>
                    </div>
                    <div class="about-study-master">
                        <div class="master-img-container">
                            <div class="master-img"></div>
                            <div class="master-txt">????????? ?????????</div>
                        </div>
                        <div class="master-name"><%=studyService.getLeader(study.getMemberId())%></div>
                    </div>
                </div>
            </div>
            <div class="top-rate">
                <div class="top-rate-header flex">?????? ?????????</div>
                <div class="top-content">
                    <ul>
                        <li class="card">
                            <div class="card-content">
                                <div class="profile">
                                    <div class="profile-picture"></div>
                                    <div class="profile-name">?????????</div>
                                    <div class="date">1h 20m ago</div>
                                </div>
                                <div class="title">CSS ????????? ??? ?????????????</div>
                                <div class="content">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Architecto culpa error eum, exercitationem, magni molestiae nam natus ratione repellendus sapiente sint temporibus unde! Culpa distinctio exercitationem facilis ipsa maiores odio, possimus quam quis recusandae repudiandae saepe sapiente similique sunt suscipit ut. Dolores excepturi incidunt porro quaerat quidem? Alias cumque cupiditate dolores iusto magnam magni recusandae, sit totam ullam. A doloremque eos labore libero maiores molestias nihil nulla quas rerum sed!</div>
                                <div class="etc">
                                    <div class="comment">
                                        <div class="comment-img"></div>
                                        <div class="comment-cnt">2 comments</div>
                                    </div>
                                    <div class="save">
                                        <div class="save-img"></div>
                                        <div class="save-txt">save</div>
                                    </div>
                                </div>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
        </aside>

        <div class="modal hide">
            <div class="modal-board">
                <div class="modal-con">
                    <div class="modal-head">
                        <div class="write-hand"></div>
                        <div class="write-content">?????? ??????????????????.</div>
                    </div>
                    <form class="modal-body" action="/study/write" method="post">
                    	<input type="hidden" name="id" value=<%=id%>>
                        <input class="modal-title" type="text" name="title" placeholder="????????? ???????????????">
                        <textarea class="modal-content" cols="30" rows="10" name="content"></textarea>
                        <div class="modal-footer">
                            <button type="submit">??????</button>
                            <button type="button" class="cancelBtn">??????</button>
                        </div>
                    </form>

                </div>
            </div>
        </div>
        <%@include file="/layout/footer.jsp" %>
    </div>
    <script>
    	const upBtn = document.querySelector('.up');
        const write = document.querySelector('.write-section');
        const modal = document.querySelector('.modal');
        write.addEventListener('click', () =>{
            if(modal.classList.contains('hide')){
                modal.classList.remove('hide');
                modal.classList.add('flex-show');
            }
        });
        
        upBtn.addEventListener('click', (e) => {
        	console.log(e);
        })

        modal.addEventListener('click', (e) => {
           if(e.target.classList.contains('modal') || e.target.classList.contains('cancelBtn')){
               modal.classList.add('hide');
               modal.classList.remove('flex-show');
           }
        });
        window.addEventListener("load", () =>{
            const button = document.querySelector(".btn-show");
            var flag = true;
            button.addEventListener("click", function(e) {
                const aside = document.querySelector(".about-study");

                console.log(aside);
                if(flag){
                    aside.style='display: block; transition: 1s;';
                    flag = !flag;
                }
                else{
                    aside.style='display: none; transition: 1s;';
                    flag = !flag;
                }
            });
        });
    </script>
</body>
</html>