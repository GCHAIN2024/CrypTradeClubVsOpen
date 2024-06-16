using static MauiLogics.Album;
using static MauiLogics.Runtime;

namespace Maui.Views;

public partial class AlbumDetailPage : ContentPage
{
    public AlbumDetailPage()
	{
		InitializeComponent();

        reloadAlbum(this.layout.Children);
    }
}