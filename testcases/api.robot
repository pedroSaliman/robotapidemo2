*** Settings ***
Library   RequestsLibrary
Library   Collections




*** Variables ***
${basrurl}   https://dummyjson.com
${users}     /users
${singleuser}  /users/1
${searchuser}  /users/search?q=John
${filter}      users/filter?key=hair.color&value=Brown
${userscart}   users/5/carts
${userspost}   /users/5/posts
${userstodos}  users/5/todos

${postuser}     /users/add
${putuser}    /users/1


*** Test Cases ***

GetlistUsers
    [Tags]    ListUser
    create session   session  ${basrurl}
   ${response}=   get on session  session    ${users}
   log to console   ${response}
   log to console   ${response.status_code}
   log to console   ${response.content}
   #####Validation
   ${status}=    convert to string     ${response.status_code}
   should be equal  ${status}   200
    ${content}=   convert to string  ${response.content}
    should contain  ${content}   Terry
#    ${contenttypevalue}=   get from dictionary    ${response.headers}     Content-Type
#    should be equal  ${contenttypevalue}    application/json; charset=utf-8
####################TC2
GetSingleUser
    [Tags]  single 


      create session   session  ${basrurl}
   ${response}=   get on session  session    ${singleuser}
   log to console   ${response}
   log to console   ${response.status_code}
   log to console   ${response.content}
   #####Validation
   ${status}=    convert to string     ${response.status_code}
   should be equal  ${status}   200
    ${content}=   convert to string  ${response.content}
    should contain  ${content}   Medhurst
#######################TC3
GetSearchUser
    [Tags]  search 


      create session   session  ${basrurl}
   ${response}=   get on session  session    ${searchuser}
   log to console   ${response}
   log to console   ${response.status_code}
   log to console   ${response.content}
   #####Validation
   ${status}=    convert to string     ${response.status_code}
   should be equal  ${status}   200
     ${content}=   convert to string  ${response.content}
     should contain  ${content}   Johnathon


#######################TC4
GetFilterUser
    [Tags]  filter 


      create session   session  ${basrurl}
   ${response}=   get on session  session    ${filter}
   log to console   ${response}
   log to console   ${response.status_code}
   log to console   ${response.content}
   #####Validation
   ${status}=    convert to string     ${response.status_code}
   should be equal  ${status}   200
      ${content}=   convert to string  ${response.content}
      should contain  ${content}   jevanson1b@admin.ch


#######################TC5

GetUsersCart
    [Tags]  usercart 


      create session   session  ${basrurl}
   ${response}=   get on session  session    ${userscart}
   log to console   ${response}
   log to console   ${response.status_code}
   log to console   ${response.content}
   #####Validation
   ${status}=    convert to string     ${response.status_code}
   should be equal  ${status}   200
    


#######################TC6


GetUsersPost
    [Tags]  userpost 


      create session   session  ${basrurl}
   ${response}=   get on session  session    ${userspost}
   log to console   ${response}
   log to console   ${response.status_code}
   log to console   ${response.content}
   #####Validation
   ${status}=    convert to string     ${response.status_code}
   should be equal  ${status}   200



#######################TC7

GetUserstodo
    [Tags]  usertodo


      create session   session  ${basrurl}
   ${response}=   get on session  session    ${userstodos}
   log to console   ${response}
   log to console   ${response.status_code}
   log to console   ${response.content}
   #####Validation
   ${status}=    convert to string     ${response.status_code}
   should be equal  ${status}   200


#######################TC8

PostUser
    [Tags]  postuser
       create session   session  ${basrurl}
       ${body}=  Create Dictionary  firstName=mohamed lastName=walled age=22
       ${response}=   post on session  session    ${postuser}  ${body}
       log to console   ${response}
       log to console   ${response.status_code}
       log to console   ${response.content}
       #####Validation
       ${status}=    convert to string     ${response.status_code}
       should be equal  ${status}   200
    


#######################TC9
PutUser
    [Tags]  put
       create session   session  ${basrurl}
       ${body}=  Create Dictionary   lastName=salah 
       ${response}=   put on session  session    ${putuser}  ${body}
       log to console   ${response}
       log to console   ${response.status_code}
       log to console   ${response.content}
       #####Validation
       ${status}=    convert to string     ${response.status_code}
       should be equal  ${status}   200
   
#######################TC10

DeleteUser
    [Tags]  delete
       create session   session  ${basrurl}
       ${response}=   delete on session  session    ${putuser}  
       log to console   ${response}
       log to console   ${response.status_code}
       log to console   ${response.content}
       #####Validation
       ${status}=    convert to string     ${response.status_code}
       should be equal  ${status}   200
   

