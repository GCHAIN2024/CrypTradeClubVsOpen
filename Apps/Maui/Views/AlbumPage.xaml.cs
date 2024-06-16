namespace Maui.Views;
using static MauiLogics.Album;
public partial class AlbumPage : ContentPage
{

    public AlbumPage()
	{
		InitializeComponent();

        reloadAllAlbums(this.layout.Children, To__AlbumDetailPage); 
    }

    public void To__AlbumDetailPage()
    {
        Navigation.PushAsync(new AlbumDetailPage());
    }

}