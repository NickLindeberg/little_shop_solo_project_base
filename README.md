# Little Shop of Orders, v2

Week 5/6 Solo Project
  
- I was given code to work on to add the following extensions.

- Directions to use application.  

  - Fork, then clone down this repo to your local machine
  - Run bundle install and bundle update to make sure you have the most current versions of the gems
  - Run rake db:{drop,create,migrate,seed}
  
#### Mod 2 Learning Goals reflected:

- Database relationships and migrations
- Advanced ActiveRecord
- Software Testing
- HTML/CSS layout and styling
- Rails development (including routing)

## Bulk Discount (counts as 1 extension point)

Merchants can implement bulk discount rates on their inventory. When a user sets their cart quantity to a certain level, those discounts get applied. For example, a merchant might set bulk discounts this way:
- 1 to 10 of a single item, no discount
- 10 to 20 of a single item, 5% discount on that item's price
- 20+ of a single item, 10% discount on that item's price

---

## Users can rate items (counts as 1 extension point)

Users will have the ability to leave ratings for items they have successfully purchased.

Users cannot rate items from orders which have been canceled by the user or an admin.

Users can write one rating per item per order. If the user orders an item (in any quantity) they can leave one rating. If they order the item again in a different order, the user can leave another rating.

Build all CRUD functionality for users to add a rating through their order show page.

Users can disable any rating they created. Admins can enable or disable any rating.

Disabled ratings should not factor into total counts of ratings, nor averages of ratings.

Ratings will include a title, a description, and a rating from 1 to 5.

---
