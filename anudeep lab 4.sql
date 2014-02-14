       -- lab-4   name:Anudeep vattikuti    cwid:200 53 275      date:2/14/2014--

       --1.get the cities of agents booking an order for customers 'basics'


       select city
       from agents
       where aid in ( select aid 
                      from orders
                      where cid in(  select cid 
                                       from customers
                                       where name= 'Basics'))

       --2.Get	the pid of products ordered through any	agent	who makes at least one	order	for a customer in kyoto--


        select distinct pid
        from orders
        where aid in( select aid 
                      from orders
                      where cid in( select cid 
                                    from customers
                                    where city='Kyoto'))
         order by pid asc


         --3.Find the cids and	names	of customers	who never placed an order through agent	a03--


         select cid ,name
         from customers
         where cid not in( select cid
                        from orders
                        where aid ='a03')


          --4.Get the	cids and names	of customers	who ordered both product p01 and p07 --                                   


          select cid,name
          from customers
          where cid in(select cid 
                       from orders
                       where pid in('p01','p07'))
          order by cid asc             


          --5.Get the	pids	of products ordered by	any customers	who ever placed	an order through agent a03--


          select distinct pid
          from orders
          where cid  in(select cid 
                       from orders
                       where aid='a03')
          order by pid asc

         --6.Get the names and	discounts of	all customers	who	place	orders	through	agents	in dallas or duluth--


         select name,discount
         from customers
         where cid in(select cid 
                      from orders
                      where aid in(select aid
                                   from Agents
                                   where city in('Dallas','Duluth')))


       --7.. Find all customers	who have the	same	discount as that of any	customers in Dallas or Kyoto


         select *
         from customers
         where discount in( select discount
                            from customers
                            where city not in('Dallas','Kyoto'))
         and discount in   (select discount 
                   from customers
                   where city  in('Dallas','Kyoto'))

         and city not in ('Dallas','Kyoto')
                            



                                


          
          
           