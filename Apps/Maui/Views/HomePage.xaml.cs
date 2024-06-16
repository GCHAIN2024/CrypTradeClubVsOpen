namespace Maui.Views;

using static MauiLogics.Home;
using static MauiLogics.Launching;
public partial class HomePage : ContentPage
{

    public HomePage()
	{
		InitializeComponent();
        initHome(this.layout.Children);
    }

}