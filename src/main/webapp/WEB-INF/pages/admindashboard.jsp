<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Bonsai Admin Dashboard</title>
  <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600&display=swap" rel="stylesheet" />
  <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
  <style>
    * {
      margin: 0;
      padding: 0;
      box-sizing: border-box;
      font-family: 'Inter', sans-serif;
    }
    body {
      background-color: #f7f8fa;
      color: #333;
      display: flex;
      height: 100vh;
    }
    .sidebar {
      width: 220px;
      background-color: #ffffff;
      border-right: 1px solid #e0e0e0;
      padding: 30px 20px;
    }
    .sidebar h2 {
      margin-bottom: 30px;
      color: #4caf50;
      font-size: 1.2em;
    }
    .sidebar nav a {
      display: block;
      padding: 12px 10px;
      color: #333;
      text-decoration: none;
      border-radius: 8px;
      margin-bottom: 10px;
      transition: background 0.3s;
      cursor: pointer;
    }
    .sidebar nav a:hover {
      background-color: #e8f5e9;
      color: #4caf50;
    }
    .main {
      flex: 1;
      padding: 30px;
      overflow-y: auto;
    }
    .header {
      font-size: 1.5em;
      margin-bottom: 20px;
    }
    .stats {
      display: flex;
      gap: 20px;
      margin-bottom: 30px;
      flex-wrap: wrap;
    }
    .card {
      background-color: #fff;
      padding: 20px;
      border-radius: 12px;
      flex: 1 1 200px;
      box-shadow: 0 2px 4px rgba(0,0,0,0.05);
    }
    .card h3 {
      margin-bottom: 10px;
      font-size: 1em;
      color: #777;
    }
    .card p {
      font-size: 1.4em;
      font-weight: bold;
    }
    .section {
      background-color: #fff;
      padding: 20px;
      border-radius: 12px;
      box-shadow: 0 2px 4px rgba(0,0,0,0.05);
      margin-bottom: 30px;
      display: none;
    }
    .section.active {
      display: block;
    }
    table {
      width: 100%;
      border-collapse: collapse;
      margin-top: 10px;
    }
    th, td {
      text-align: left;
      padding: 12px;
      border-bottom: 1px solid #eee;
    }
    th {
      color: #4caf50;
      background-color: #f1f8f4;
    }
    form label {
      display: block;
      margin-top: 10px;
      font-weight: 600;
    }
    form input, form button {
      width: 100%;
      padding: 10px;
      margin-top: 5px;
      border: 1px solid #ccc;
      border-radius: 6px;
    }
    form button {
      background-color: #4caf50;
      color: white;
      font-weight: bold;
      cursor: pointer;
      margin-top: 15px;
    }
    .low-stock-list {
      list-style: none;
      padding-left: 0;
      color: #d32f2f;
      font-weight: 500;
      line-height: 1.8em;
    }
    .low-stock-list li {
      background-color: #fff3f3;
      padding: 10px;
      border: 1px solid #ffcdd2;
      border-radius: 6px;
      margin-bottom: 8px;
    }
    .low-stock-list .product-name {
      font-weight: bold;
    }
    @media (max-width: 768px) {
      .sidebar {
        display: none;
      }
    }
  </style>
</head>
<body>
  <aside class="sidebar">
    <h2>Bonsai Admin</h2>
    <nav>
      <a onclick="showSection('overview')">Overview</a>
      <a onclick="showSection('add')">Add Product</a>
      <a onclick="showSection('edit')">Edit Product</a>
      <a onclick="showSection('remove')">Remove Product</a>
      <a onclick="showSection('orders')">Orders</a>
      <a onclick="showSection('customers')">Customers</a>
    </nav>
  </aside>

  <main class="main">
    <div class="header">Good Morning, Admin!</div>

    <!-- Overview -->
    <section id="overview" class="section active">
      <div class="stats">
        <div class="card"><h3>Total Products</h3><p>250</p></div>
        <div class="card"><h3>Completed Orders</h3><p>124</p></div>
        <div class="card"><h3>Canceled Orders</h3><p>14</p></div>
      </div>

      <div class="charts" style="display: flex; flex-wrap: wrap; gap: 20px; justify-content: space-between;">
        <div style="flex: 1 1 300px; max-width: 350px; height: 250px; background: #fff; padding: 15px; border-radius: 12px; box-shadow: 0 2px 4px rgba(0,0,0,0.05);">
          <h4 style="margin-bottom: 10px; color: #4caf50;">Sales Overview</h4>
          <canvas id="barChart" style="width: 100%; height: 180px;"></canvas>
        </div>
        <div style="flex: 1 1 300px; max-width: 350px; height: 250px; background: #fff; padding: 15px; border-radius: 12px; box-shadow: 0 2px 4px rgba(0,0,0,0.05);">
          <h4 style="margin-bottom: 10px; color: #4caf50;">Product Share</h4>
          <canvas id="pieChart" style="width: 100%; height: 180px;"></canvas>
        </div>
      </div>

      <div class="section" style="margin-top: 20px;">
        <h3 style="margin-bottom: 10px; color: #d32f2f;">Low Stock Alerts</h3>
        <ul class="low-stock-list">
          <li><span class="product-name">Mini Jade Bonsai</span> – Only <strong>4</strong> left in stock</li>
          <li><span class="product-name">Juniper Bonsai</span> – Only <strong>2</strong> left in stock</li>
          <li><span class="product-name">Maple Bonsai</span> – Only <strong>3</strong> left in stock</li>
        </ul>
      </div>
    </section>

    <!-- Add Product -->
    <section id="add" class="section">
      <h3>Add Product</h3>
      <form>
        <label>Product Name</label>
        <input type="text" placeholder="Enter product name">
        <label>Description</label>
        <input type="text" placeholder="Enter product description">
        <label>Price</label>
        <input type="number" placeholder="Enter price">
        <label>Stock</label>
        <input type="number" placeholder="Enter stock quantity">
        <button type="submit">Add Product</button>
      </form>
    </section>

    <!-- Edit Product -->
    <section id="edit" class="section">
      <h3>Edit Product</h3>
      <form>
        <label>Product ID</label>
        <input type="text" placeholder="Enter product ID">
        <label>Update Name</label>
        <input type="text" placeholder="Update name">
        <label>Update Description</label>
        <input type="text" placeholder="Update description">
        <label>Update Price</label>
        <input type="number" placeholder="Update price">
        <label>Update Stock</label>
        <input type="number" placeholder="Update stock">
        <button type="submit">Save Changes</button>
      </form>
    </section>

    <!-- Remove Product -->
    <section id="remove" class="section">
      <h3>Remove Product</h3>
      <form>
        <label>Product ID</label>
        <input type="text" placeholder="Enter product ID to remove">
        <button type="submit">Remove Product</button>
      </form>
    </section>

    <!-- Orders -->
    <section id="orders" class="section">
      <h3>Orders</h3>
      <table>
        <thead>
          <tr><th>Order ID</th><th>Customer</th><th>Date</th><th>Status</th><th>Total</th></tr>
        </thead>
        <tbody>
          <tr><td>ORD101</td><td>Emily Rose</td><td>2025-04-12</td><td>Completed</td><td>$45</td></tr>
          <tr><td>ORD102</td><td>John Smith</td><td>2025-04-13</td><td>Pending</td><td>$72</td></tr>
        </tbody>
      </table>
    </section>

    <!-- Customers -->
    <section id="customers" class="section">
      <h3>Customers</h3>
      <table>
        <thead>
          <tr><th>Customer ID</th><th>Name</th><th>Email</th><th>Joined Date</th></tr>
        </thead>
        <tbody>
          <tr><td>C001</td><td>Emily Rose</td><td>emily@example.com</td><td>2023-08-15</td></tr>
          <tr><td>C002</td><td>John Smith</td><td>john@example.com</td><td>2023-09-02</td></tr>
        </tbody>
      </table>
    </section>
  </main>

  <script>
    function showSection(id) {
      document.querySelectorAll('.section').forEach(section => {
        section.classList.remove('active');
      });
      document.getElementById(id).classList.add('active');
    }

    new Chart(document.getElementById('barChart').getContext('2d'), {
      type: 'bar',
      data: {
        labels: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun'],
        datasets: [{
          label: 'Monthly Sales ($)',
          data: [1200, 1900, 3000, 2500, 3200, 2900],
          backgroundColor: '#4caf50'
        }]
      },
      options: {
        responsive: true,
        maintainAspectRatio: true,
        scales: {
          y: { beginAtZero: true }
        },
        plugins: {
          legend: {
            labels: { font: { size: 12 } }
          }
        }
      }
    });

    new Chart(document.getElementById('pieChart').getContext('2d'), {
      type: 'pie',
      data: {
        labels: ['Ficus Bonsai', 'Jade Bonsai', 'Juniper Bonsai'],
        datasets: [{
          label: 'Product Share',
          data: [45, 25, 30],
          backgroundColor: ['#4caf50', '#81c784', '#a5d6a7']
        }]
      },
      options: {
        responsive: true,
        maintainAspectRatio: true,
        plugins: {
          legend: {
            labels: { font: { size: 12 } }
          }
        }
      }
    });
  </script>
</body>
</html>
