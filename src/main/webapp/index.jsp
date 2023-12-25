<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ page import = "java.sql.*" %>
<%@ page import = "com.tech.blog.helper.ConnectionProvider" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>TechBlog | Home page</title>

	<!-- CSS Files -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	<link href="CSS/mystyle.css" rel="stylesheet" type="text/css"/>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	
	<style>
	  .banner_background{
	      /*clip-path: polygon(0 0, 100% 0, 100% 92%, 69% 100%, 32% 93%, 0 100%); */
	  }
	  .para-text{
	  	  margin: auto;
	  	  padding:20px;
	  	  width: 900px;
	  	  height: 600px;
	  	  background-color: white;
	  	  border-radius: 2%;
	  	  color: black;
	  	  font-family: red-serifs;
	  	  margin-bottom: 30px;
	  	  border: 5px solid black;
	  	  
	  }
	  
	  body{
	  	background: url(Images/bg4.png);
	  	background-size: cover;
	  	background-attachment: fixed;
	  }
	  
	  
	  
	  .container1 {
            display: flex;
            justify-content: center;
            align-items: center;
            
        }
	  
	  /* Style for the card container */
        .card {
            display: flex;
            border: 1px solid #ccc;
            border-radius: 5px;
            overflow: hidden;
            margin: 10px;
            max-width: 400px;
            justify-content: center; /* Horizontally center-align the card */
            align-items: center; /* Vertically center-align the card */
            align-self: center;
            margin-bottom: 30px;
            background-color: #f4f4f4;            
        }

        /* Style for the left side (image) of the card */
        .card-left {
            flex: 1;
            background-color: #f4f4f4;
        }

        /* Style for the right side (text) of the card */
        .card-right {
            flex: 1;
            padding: 20px;            
            display: flex;
            flex-direction: column;
            justify-content: space-between;
        }

        /* Style for the heading and text */
        .card-heading {
            font-weight: bold;
            font-size: 20px;
            text-decoration: none;
            color: #333;
            text-align: center;
        }

        /* Style for the image */
        .card-left img {
            width: 100%;
            height: 100%;
            object-fit: cover; /* Maintain aspect ratio and cover the container */
        }
        
        .footer {
        	background-color: #333; /* Background color for the footer */
            color: #fff; /* Text color for the footer */
            padding: 20px; /* Padding for spacing */
            text-align: center; /* Center-align text within the footer */
        }
	  
	  
	  
	</style>

</head>
<body>
    
    <!-- including navigation bar -->    
    <%@include file="navbar.jsp" %>
    
    <!-- Banner -->    
    <div class="container-fluid p-0 m-0">
        <div class="jumbotron primary-background text-white banner_background">
            <div class="container">
                <h3 class="display-3" >Welcome to TechBlog</h3>
                <br>
                <div style="font-size: 16px;, font-family: cursive;" >
                <p style="text-align: justify;">
                	Your one-stop destination for all things tech! Dive into a world where computer technologies come to life through the power of words, images, and code. Our platform is a vibrant community of tech enthusiasts who share their insights, experiences, and knowledge with simplicity and passion. Whether you're a beginner or a seasoned pro, you'll find blogs that demystify tech concepts, showcase captivating visuals, and provide practical insights. You can also interact with fellow users, express your appreciation with likes, and engage in thoughtful discussions. At TechBlog, we believe that understanding technology should be accessible and enjoyable for everyone. Join us on this exciting journey through the digital landscape of computer technologies, where curiosity is always welcome, and learning is a shared adventure.
                </p>
                <p style="text-align: justify;">
					TechBlog is not just a platform; it's a community where knowledge flows freely, and questions are met with enthusiastic answers. Our blogs feature a blend of informative articles, practical coding tips, and captivating visual content, making tech topics approachable for all. 
					<br><br>
					As you explore the diverse array of blogs, you'll encounter not just lines of code but the stories behind them—real experiences, real challenges, and real victories. Whether you're seeking guidance on the latest programming languages, curious about emerging technologies, or looking to share your own tech adventures, TechBlog is your digital companion.
					
					And it doesn't stop there! TechBlog also lets you shape your own profile, where you can showcase your expertise, share your thoughts, and connect with like-minded individuals. It's your space to shine in the ever-evolving universe of technology.
					
					So, whether you're here to learn, share, or simply appreciate the wonders of technology, you're in the right place. Welcome to TechBlog, where every click is a step forward in your tech journey, and every interaction sparks a new idea. Join us today and be part of a community that's passionate, welcoming, and always curious.
				</p>
				</div>
                <a href="register.jsp" class="btn btn-outline-warning btn-lg"><span class="fa fa-user-plus"></span> Start! its Free</a>
                <a href ="login.jsp" class="btn btn-outline-warning btn-lg"><span class="fa fa-user-circle"></span> Login</a>
            </div>            
        </div>
    </div>
    
    <!-- Cards -->
    <!-- <div class="container">
	    <div class="row mb-4">
	    	<div class="col-md-4 ml-4">
	    		<div class="card" style="width: 18rem;">
			   	    <div class="card-body">
					    <h5 class="card-title">Java Programming</h5>
					    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
					    <a href="#" onclick="alert()" class="btn primary-background text-white">Read more</a>
				    </div>
				</div>
	    	</div>	    	
    </div> -->
    
    <!-- JavaScript Files -->
    <script src="https://code.jquery.com/jquery-3.7.0.min.js" integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g=" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    <script src="JS/myjs.js" type="text/javascript"></script>
    
    <h3 class="display-5 ml-3" style="font-family: cursive;"><B><U>Some Latest Tech</U> :-</B></h3> <br>
    
    <div class="container1">
    
    <!-- 1. -->
    <div class="card">
        <!-- Left side (image) of the card -->
        <div class="card-left">
            <a href="https://betterprogramming.pub/django-ninja-built-in-django-feels-like-fastapi-72f394450b27" > <!-- Replace with the actual link -->
                <img src="https://miro.medium.com/v2/resize:fit:1100/format:webp/1*8mFoS4QHc9t8BUIAVQeetg.jpeg" alt="Image"> <!-- Replace with the actual image URL and alt text -->
            </a>
        </div>

        <!-- Right side (text) of the card -->
        <div class="card-right">
            <a href="https://betterprogramming.pub/django-ninja-built-in-django-feels-like-fastapi-72f394450b27" class="card-heading" style="font-family: cursive;"> <!-- Replace with the actual link -->
                Django-Ninja: Built-in Django Feels like FastAPI <!-- Replace with your heading text -->
            </a>
            <p style="font-family: cursive;">Django is the web framework most widely used by Python developers. Django offers many function...</p>
        </div>
    </div>
    
    <!-- 2. -->
    <div class="card">
        <!-- Left side (image) of the card -->
        <div class="card-left">
            <a href="https://www.pluralsight.com/blog/software-development/chatgpt-vs-bard-coding"> <!-- Replace with the actual link -->
                <img src="https://www.pluralsight.com/content/dam/ps/images/resource-center/blog/header-hero-images/ChatGPT-vs-Bard-c.png" alt="Image"> <!-- Replace with the actual image URL and alt text -->
            </a>
        </div>

        <!-- Right side (text) of the card -->
        <div class="card-right">
            <a style="font-family: cursive;" href="https://www.pluralsight.com/blog/software-development/chatgpt-vs-bard-coding" class="card-heading"> <!-- Replace with the actual link -->
                ChatGPT Vs Bard: Which is better for coding? <!-- Replace with your heading text -->
            </a>
            <p style="font-family: cursive;">For programmers, Generative AI offers tangible benefits. It helps with writing and debugging...</p>
        </div>
    </div>
    
    
    
    <!-- 3. -->
    <div class="card">
        <!-- Left side (image) of the card -->
        <div class="card-left">
            <a href="https://www.itbrew.com/stories/2023/09/26/basic-html-mode-in-gmail-is-going-the-way-of-the-dodo"> <!-- Replace with the actual link -->
                <img src="https://cdn.sanity.io/images/bl383u0v/production/311038a6846523774c285491a8143c9231481762-1500x1000.jpg?w=900&h=600&q=80&fit=max&auto=format&dpr=1.5" alt="Image"> <!-- Replace with the actual image URL and alt text -->
            </a>
        </div>

        <!-- Right side (text) of the card -->
        <div class="card-right">
            <a style="font-family: cursive;" href="https://www.itbrew.com/stories/2023/09/26/basic-html-mode-in-gmail-is-going-the-way-of-the-dodo" class="card-heading"> <!-- Replace with the actual link -->
                Basic HTML mode in Gmail is going the way of the dodo <!-- Replace with your heading text -->
            </a>
            <p style="font-family: cursive;" >Google is axing one of Gmail oldest features the ability to view an inbox in Basic HTML. The Basic..</p>
        </div>
    </div>
    
    </div>
    
    <div class="container1">
    
    <!-- 4. -->
    <div class="card">
        <!-- Left side (image) of the card -->
        <div class="card-left">
            <a href="https://in.mashable.com/tech/9475/the-10-founding-fathers-of-the-web"> <!-- Replace with the actual link -->
                <img src="https://sm.mashable.com/t/mashable_in/photo/default/img_n4bf.2496.jpg" alt="Image"> <!-- Replace with the actual image URL and alt text -->
            </a>
        </div>

        <!-- Right side (text) of the card -->
        <div class="card-right">
            <a style="font-family: cursive;" href="https://in.mashable.com/tech/9475/the-10-founding-fathers-of-the-web" class="card-heading"> <!-- Replace with the actual link -->
                The 10 Founding Fathers Of The Web <!-- Replace with your heading text -->
            </a>
            <p style="font-family: cursive;" >While the phrase "founding fathers" is often used in conjunction with men like Benjamin Franklin...</p>
        </div>
    </div>
        
    
    <!-- 5. -->
    <div class="card">
        <!-- Left side (image) of the card -->
        <div class="card-left">
            <a  href="https://www.electric.ai/blog/how-to-uninstall-apps"> <!-- Replace with the actual link -->
                <img src="https://www.electric.ai/wp-content/uploads/BLOG-How-to-Uninstall-Apps-on-Every-Device.gif" alt="Image"> <!-- Replace with the actual image URL and alt text -->
            </a>
        </div>

        <!-- Right side (text) of the card -->
        <div class="card-right">
            <a style="font-family: cursive;" href="https://www.electric.ai/blog/how-to-uninstall-apps" class="card-heading"> <!-- Replace with the actual link -->
                How to Uninstall Apps on Every Device <!-- Replace with your heading text -->
            </a>
            <p style="font-family: cursive;">Uninstalling apps from your device can be done in a few easy steps. Whether its to free up storage space or simply clear out programs you no...</p>
        </div>
    </div>
    
    
    
    <!-- 6. -->
    <div class="card">
        <!-- Left side (image) of the card -->
        <div class="card-left">
            <a href="https://in.mashable.com/tech/61035/meta-reveals-xbox-cloud-gaming-is-coming-to-quest-3-in-december"> <!-- Replace with the actual link -->
                <img src="https://sm.mashable.com/t/mashable_in/article/m/meta-revea/meta-reveals-xbox-cloud-gaming-is-coming-to-quest-3-in-decem_dre7.2496.jpg" alt="Image"> <!-- Replace with the actual image URL and alt text -->
            </a>
        </div>

        <!-- Right side (text) of the card -->
        <div class="card-right">
            <a style="font-family: cursive;" href="https://in.mashable.com/tech/61035/meta-reveals-xbox-cloud-gaming-is-coming-to-quest-3-in-december" class="card-heading"> <!-- Replace with the actual link -->
                Meta Reveals Xbox Cloud Gaming Is Coming To Quest 3 In December <!-- Replace with your heading text -->
            </a>
            <p style="font-family: cursive;">it was revealed that Xbox Cloud Gaming would make its way to Meta Quest headsets sometime...</p>
        </div>
    </div>
    
    </div>
    
    <div class="container1">
    
    <!-- 7. -->
    <div class="card">
        <!-- Left side (image) of the card -->
        <div class="card-left">
            <a href="https://www.pluralsight.com/blog/learning-and-development/why-you-should-upskill-tech"> <!-- Replace with the actual link -->
                <img src="https://www.pluralsight.com/content/dam/pluralsight2/cm-blog-files/SoU_BlogComic_2_C.png" alt="Image"> <!-- Replace with the actual image URL and alt text -->
            </a>
        </div>

        <!-- Right side (text) of the card -->
        <div class="card-right">
            <a style="font-family: cursive;" href="https://www.pluralsight.com/blog/learning-and-development/why-you-should-upskill-tech" class="card-heading"> <!-- Replace with the actual link -->
                I work in tech: Should I always be upskilling? <!-- Replace with your heading text -->
            </a>
          <p style="font-family: cursive;">If you work in tech, its likely someone has told you that you should always be upskilling: earning a new certificate, learning a new language...</p>
        </div>
    </div>
    
    <!-- 8 -->
    <div class="card">
        <!-- Left side (image) of the card -->
        <div class="card-left">
            <a href="https://www.pluralsight.com/resources/blog/leadership/learn-to-code-bootcamp-programs"> <!-- Replace with the actual link -->
                <img src="https://www.pluralsight.com/content/dam/ps/images/resource-center/blog/header-hero-images/immersive-learning-header.resize.842.jpg" alt="Image"> <!-- Replace with the actual image URL and alt text -->
            </a>
        </div>

        <!-- Right side (text) of the card -->
        <div class="card-right">
            <a style="font-family: cursive;" href="https://www.pluralsight.com/resources/blog/leadership/learn-to-code-bootcamp-programs" class="card-heading"> <!-- Replace with the actual link -->
                How to build tech skills in your org with a learn-to-code bootcamp <!-- Replace with your heading text -->
            </a>
          <p style="font-family: cursive;">Hiring external talent to fill open roles can be expensive and there is no guarantee you all find the talent you need in the marketplace, especially for emerging...</p>
        </div>
    </div>   
    
    
    <!-- 9 -->
    <div class="card" style="height: 455px">
        <!-- Left side (image) of the card -->
        <div class="card-left">
            <a href="https://www.wired.com/story/container-registry-security-chainguard/"> <!-- Replace with the actual link -->
                <img src="https://media.wired.com/photos/646cfa9988479249e0cc294e/master/w_1920,c_limit/There%E2%80%99s-Finally-a-Way-to-Secure-a-Crucial-Piece-of-The-Cloud-Security-GettyImages-1275782422.jpg" alt="Image"> <!-- Replace with the actual image URL and alt text -->
            </a>
        </div>

        <!-- Right side (text) of the card -->
        <div class="card-right">
            <a style="font-family: cursive;" href="https://www.wired.com/story/container-registry-security-chainguard/" class="card-heading"> <!-- Replace with the actual link -->
                There is Finally a Way to Secure a Crucial Piece of the Cloud <!-- Replace with your heading text -->
            </a>
     <p style="font-family: cursive;">as software supply-chain attacks have emerged as an everyday threat, where bad actors poison a step in the development or distribution process, the tech industry has had a...</p>        
</div>
    </div>
    
    </div>
    
    <div class="footer">
        <!-- Footer content goes here -->
        <p>&copy; 2023 | TECHBLOG. ALL RIGHTS RESERVED.</p> <!-- Replace with your website name and copyright information -->
    </div>
</body>
</html>