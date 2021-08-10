class TestsController < ApplicationController
    def users
        @users=RestClient.get('https://jsonplaceholder.typicode.com/users')
        render :json => @users
    end

    def posts
        @posts=RestClient.get('https://jsonplaceholder.typicode.com/posts')
        render :json => @posts
    end

    def userPosts
        @users=RestClient.get('https://jsonplaceholder.typicode.com/users')
        @posts=RestClient.get('https://jsonplaceholder.typicode.com/posts')
        render json:{
            results: JSON.parse(@posts).map do |post|
                user=JSON.parse(@users).select {|u| u["id"]==post["userId"]}
                {name: user[0]["name"], email: user[0]["email"], id: user[0]["id"], title: post["title"], body: post["body"]}
            end}
    end
end
