# Test exam for backend developer position

[Tracker](https://www.pivotaltracker.com/n/projects/2469778)

[ER diagram](https://drive.google.com/file/d/1VJjjbzy6hE8EDl5K3QDbetO5XTy7vjIR/view)

### Requirements.

- Publishers produce books that are sold in shops.
- A book can be distributed via multiple shops.
- A shop can sell multiple copies of a book. .

### What should to be done

Please model the required database relations and create API Endpoints described below. The code should be covered with tests (rspec).

### Endpoint 1

for a specific Publisher it should return the list of shops selling at least one book of that publisher. Shops should be ordered by the number of books sold. Each shop should include the list of Publisher’s books that are currently in stock.

Example response:
```
{
  shops:[
   {
     “id”: 1,
     “name”: “Amazon”,
     “books_sold_count”: 10,
     “books_in_stock”: [
       {
         “id”: 2,
         “title”: “Yiddish songs”,
         “copies_in_stock”: 3
       },
       …
     ]
   },
   …
 ]
}
```

### Endpoint 2

For a specific Shop it should mark one or multiple copies of a book as sold.
