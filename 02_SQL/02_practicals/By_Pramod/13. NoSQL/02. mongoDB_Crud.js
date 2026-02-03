//🔹 Insert (Create)
// Single document
db.emp.insert({_id: 1, ename: "James", designation: "Analyst", salary: 30000});

// Multiple documents
db.emp.insert([
  {_id: 2, ename: "Ethan", designation: "Manager", salary: 90000},
  {_id: 3, ename: "Emily", designation: "Analyst", salary: 25000}
]);

// Insert with missing field
db.emp.insert({_id: 4, ename: "Jack", salary: 20000});

// Insert without _id (auto-generated)
db.emp.insert({ename: "Steve", designation: "Architect", salary: 95000});



// 🔹 Find (Read)
// All documents
db.emp.find();

// Filter documents (WHERE clause equivalent)
db.emp.find({designation: "Analyst"});

// Filter fields (SELECT specific columns)
db.emp.find({}, {ename: 1, salary: 1});

// Suppress _id field
db.emp.find({}, {ename: 1, salary: 1, _id: 0});

// Using $in operator (IN clause equivalent)
db.emp.find({salary: {$in: [30000, 90000]}});

// Using $or operator (OR clause equivalent)
db.emp.find({$or: [{designation:"Analyst"}, {ename:"Ethan"}]}, {ename: 1, salary: 1});



// 🔹 Update
// Update existing field
db.emp.update({_id: 1}, {$set: {salary: 35000}});

// Add new field
db.emp.update({_id: 2}, {$set: {dept: "HR"}});

// Update multiple fields
db.emp.update({_id: 4}, {$set: {designation: "Analyst", dept: "ETA"}});

// Update all documents (multi:true)
db.emp.update({}, {$set: {salary: 10000}}, {multi: true});

// Replace entire document (fields not provided become null)
db.emp.update({_id: 3}, {ename: "Mark", designation: "Manager"});



🔹 Remove (Delete)
// Delete single document
db.emp.remove({_id: 4});

// Delete multiple documents (salary < 30000)
db.emp.remove({salary: {$lt: 30000}});

// Delete all documents
db.emp.remove({});



//🔹 Tryouts (Practice Exercises)
Insert Tryout
db.emp.insert({_id: 1, ename: "James", designation: "Analyst", salary: 30000});
db.emp.insert([
  {_id: 2, ename: "Ethan", designation: "Manager", salary: 90000},
  {_id: 3, ename: "Emily", designation: "Analyst", salary: 25000}
]);
db.emp.insert({_id: 4, ename:"Jack", salary: 20000});
db.emp.insert({ename: "Steve", designation: "Architect", salary: 95000});


// Find Tryout
db.emp.find();
db.emp.find({designation: "Analyst"});
db.emp.find({}, {ename: 1, salary: 1});
db.emp.find({}, {ename: 1, salary: 1, _id: 0});
db.emp.find({salary: {$in: [30000, 90000]}});
db.emp.find({$or: [{designation: "Analyst"}, {ename: "Ethan"}]}, {ename: 1, salary: 1});


// Update Tryout
db.emp.update({_id: 1}, {$set: {salary: 35000}});
db.emp.update({_id: 2}, {$set: {dept: "HR"}});
db.emp.update({_id: 4}, {$set: {designation: "Analyst", dept: "ETA"}});
db.emp.update({}, {$set: {salary: 10000}}, {multi: true});
db.emp.update({_id: 3}, {ename: "Mark", designation: "Manager"});


// Remove Tryout
db.emp.remove({_id: 4});
db.emp.remove({salary: {$lt: 30000}});
db.emp.remove({});


