import matplotlib.pyplot as plt

def draw_flow_chart():
    fig, ax = plt.subplots(figsize=(10, 8))

    # Define box style
    box_style = {"boxstyle": "round,pad=0.3", "edgecolor": "black", "facecolor": "#D3D3D3"}

    # Define positions of the boxes
    positions = {
        "Customers": (0.1, 0.9),
        "Tire Retailers": (0.1, 0.75),
        "Service Centers": (0.1, 0.6),
        "Tire Manufacturers": (0.1, 0.45),
        "Warehouse": (0.5, 0.45),
        "Rubber Waste Users": (0.1, 0.1),
        "Recycling Firms": (0.5, 0.1),
        "Distributors": (0.9, 0.1),
        "Businesses": (0.8, -0.1),
        "Government": (1.0, -0.1)
    }

    # Create boxes
    for label, (x, y) in positions.items():
        ax.text(x, y, label, ha="center", va="center",
                bbox=box_style, fontsize=12, zorder=10)

    # Draw arrows
    arrow_params = dict(arrowstyle="-|>", color="black", lw=1.5)
    arrows = [
        ("Customers", "Warehouse"),
        ("Tire Retailers", "Warehouse"),
        ("Service Centers", "Warehouse"),
        ("Tire Manufacturers", "Warehouse"),
        ("Warehouse", "Rubber Waste Users"),
        ("Warehouse", "Recycling Firms"),
        ("Warehouse", "Distributors"),
        ("Distributors", "Businesses"),
        ("Distributors", "Government")
    ]

    for start, end in arrows:
        start_x, start_y = positions[start]
        end_x, end_y = positions[end]
        ax.annotate("",
                    xy=(end_x, end_y), xytext=(start_x, start_y),
                    arrowprops=arrow_params)

    # Remove axes
    ax.axis("off")

    # Show plot
    plt.show()

if __name__ == "__main__":
    draw_flow_chart()
