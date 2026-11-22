.class Lginlemon/flower/glance/SLGlanceIsland$9;
.super Ljava/lang/Object;
.source "SLGlanceIsland.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lginlemon/flower/glance/SLGlanceIsland;->showDetails()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lginlemon/flower/glance/SLGlanceIsland;

.field final synthetic val$controller:Landroid/media/session/MediaController;

.field final synthetic val$pause:Z


# direct methods
.method constructor <init>(Lginlemon/flower/glance/SLGlanceIsland;ZLandroid/media/session/MediaController;)V
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .prologue
    .line 315
    iput-object p1, p0, Lginlemon/flower/glance/SLGlanceIsland$9;->this$0:Lginlemon/flower/glance/SLGlanceIsland;

    iput-boolean p2, p0, Lginlemon/flower/glance/SLGlanceIsland$9;->val$pause:Z

    iput-object p3, p0, Lginlemon/flower/glance/SLGlanceIsland$9;->val$controller:Landroid/media/session/MediaController;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 2

    .prologue
    .line 316
    :try_start_0
    iget-boolean v0, p0, Lginlemon/flower/glance/SLGlanceIsland$9;->val$pause:Z

    if-eqz v0, :cond_e

    iget-object v0, p0, Lginlemon/flower/glance/SLGlanceIsland$9;->val$controller:Landroid/media/session/MediaController;

    invoke-virtual {v0}, Landroid/media/session/MediaController;->getTransportControls()Landroid/media/session/MediaController$TransportControls;

    move-result-object v0

    invoke-virtual {v0}, Landroid/media/session/MediaController$TransportControls;->pause()V

    .line 318
    :goto_d
    return-void

    .line 316
    :cond_e
    iget-object v0, p0, Lginlemon/flower/glance/SLGlanceIsland$9;->val$controller:Landroid/media/session/MediaController;

    invoke-virtual {v0}, Landroid/media/session/MediaController;->getTransportControls()Landroid/media/session/MediaController$TransportControls;

    move-result-object v0

    invoke-virtual {v0}, Landroid/media/session/MediaController$TransportControls;->play()V
    :try_end_17
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_17} :catch_18

    goto :goto_d

    .line 317
    :catch_18
    move-exception v0

    goto :goto_d
.end method
