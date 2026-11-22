.class Lginlemon/flower/glance/SLGlanceIsland$7;
.super Landroid/media/session/MediaController$Callback;
.source "SLGlanceIsland.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lginlemon/flower/glance/SLGlanceIsland;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lginlemon/flower/glance/SLGlanceIsland;


# direct methods
.method constructor <init>(Lginlemon/flower/glance/SLGlanceIsland;)V
    .registers 2

    .prologue
    .line 171
    iput-object p1, p0, Lginlemon/flower/glance/SLGlanceIsland$7;->this$0:Lginlemon/flower/glance/SLGlanceIsland;

    invoke-direct {p0}, Landroid/media/session/MediaController$Callback;-><init>()V

    return-void
.end method


# virtual methods
.method public onMetadataChanged(Landroid/media/MediaMetadata;)V
    .registers 3

    .prologue
    .line 173
    iget-object v0, p0, Lginlemon/flower/glance/SLGlanceIsland$7;->this$0:Lginlemon/flower/glance/SLGlanceIsland;

    invoke-static {v0}, Lginlemon/flower/glance/SLGlanceIsland;->access$900(Lginlemon/flower/glance/SLGlanceIsland;)V

    return-void
.end method

.method public onPlaybackStateChanged(Landroid/media/session/PlaybackState;)V
    .registers 3

    .prologue
    .line 172
    iget-object v0, p0, Lginlemon/flower/glance/SLGlanceIsland$7;->this$0:Lginlemon/flower/glance/SLGlanceIsland;

    invoke-static {v0}, Lginlemon/flower/glance/SLGlanceIsland;->access$900(Lginlemon/flower/glance/SLGlanceIsland;)V

    return-void
.end method

.method public onSessionDestroyed()V
    .registers 2

    .prologue
    .line 174
    iget-object v0, p0, Lginlemon/flower/glance/SLGlanceIsland$7;->this$0:Lginlemon/flower/glance/SLGlanceIsland;

    invoke-static {v0}, Lginlemon/flower/glance/SLGlanceIsland;->access$1000(Lginlemon/flower/glance/SLGlanceIsland;)V

    return-void
.end method
