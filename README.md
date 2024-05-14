# Simple Database Query App

This SwiftUI app allows you to query a database by constructing API requests.

## Features

- **Database Selection:** Choose between "tp2" and "Club" databases.
- **User Input:** Optionally provide a username (defaults to `root`).
- **Authentication:** Enter an authtoken.
- **Query:**  Write your SQL query (defaults to "SELECT *").
- **Data Display:** The raw JSON response from the API is displayed.

## How to Use

1. **Clone/Download:** Get the project code onto your machine.
2. **Open in Xcode:**  Open the `.xcodeproj` file in Xcode.
3. **Update API Endpoint:** Replace `"https://germand.tplinkdns.com/database/"` with your actual API base URL in the `baseURL` constant.
4. **Run the App:** Click the "Run" button (or press Command+R) in Xcode.
5. **Select Database:** Use the picker to choose your database.
6. **Enter Credentials:** If required, provide your username and authtoken.
7. **Write Your Query:** Type your SQL query in the text field.
8. **Fetch Data:** Tap the "Fetch Data" button.
9. **View Response:** The app will display the raw JSON response from the API.

## Important Notes

- **URL Encoding:** This app does not currently handle URL encoding for complex queries. Be sure to manually URL-encode any special characters in your query.
- **Error Handling:** The app displays basic error messages for invalid URLs, network errors, and data conversion issues.
- **Security:** If your API requires specific authentication or authorization mechanisms, you'll need to modify the `fetchData()` method to include those details.

## Example

To fetch the first row from the "empleado" table in the "tp2" database:

1. Select "tp2" in the picker.
2. Enter your authtoken.
3. Type `SELECT * FROM empleado LIMIT 1` in the query field.
4. Tap "Fetch Data".


