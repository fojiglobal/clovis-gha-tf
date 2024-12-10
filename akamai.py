import requests

# Akamai API credentials
CLIENT_TOKEN = "your_client_token"  # Replace with your client token
CLIENT_SECRET = "your_client_secret"  # Replace with your client secret
ACCESS_TOKEN = "your_access_token"  # Replace with your access token
BASE_URL = "https://{hostname}"  # Replace {hostname} with your Akamai API endpoint (e.g., "api.ccu.akamai.com")

# Configuration details
CONFIG_ID = "your_config_id"  # Replace with your configuration ID
VERSION = "latest"  # Replace with the desired version ('latest' or specific version)
OUTPUT_FILE = "akamai_config_backup.xml"  # File name to save the backup

def export_akamai_config(client_token, client_secret, access_token, config_id, version, output_file):
    """
    Exports Akamai configuration in XML format and saves it to a file.

    Args:
        client_token (str): Akamai API client token.
        client_secret (str): Akamai API client secret.
        access_token (str): Akamai API access token.
        config_id (str): ID of the Akamai configuration to export.
        version (str): Version of the configuration to export.
        output_file (str): Path to save the exported XML configuration file.
    """
    # Headers for API authentication
    headers = {
        "Authorization": f"Bearer {access_token}",
        "Accept": "application/xml"
    }

    # API endpoint to fetch configuration
    url = f"{BASE_URL}/configurations/v1/{config_id}/versions/{version}"

    try:
        print(f"Exporting Akamai configuration ID: {config_id}, Version: {version}")
        response = requests.get(url, headers=headers)

        if response.status_code == 200:
            with open(output_file, "wb") as file:
                file.write(response.content)
            print(f"Configuration successfully exported to {output_file}")
        else:
            print(f"Failed to export configuration: {response.status_code}")
            print(response.text)
    except Exception as e:
        print(f"An error occurred: {e}")

# Call the function
export_akamai_config(CLIENT_TOKEN, CLIENT_SECRET, ACCESS_TOKEN, CONFIG_ID, VERSION, OUTPUT_FILE)
