.class Lginlemon/flower/glance/SLGlanceIsland$6;
.super Ljava/lang/Object;
.source "SLGlanceIsland.java"

# interfaces
.implements Landroid/media/session/MediaSessionManager$OnActiveSessionsChangedListener;


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
    .line 170
    iput-object p1, p0, Lginlemon/flower/glance/SLGlanceIsland$6;->this$0:Lginlemon/flower/glance/SLGlanceIsland;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onActiveSessionsChanged(Ljava/util/List;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Landroid/media/session/MediaController;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 170
    iget-object v0, p0, Lginlemon/flower/glance/SLGlanceIsland$6;->this$0:Lginlemon/flower/glance/SLGlanceIsland;

    invoke-static {v0, p1}, Lginlemon/flower/glance/SLGlanceIsland;->access$800(Lginlemon/flower/glance/SLGlanceIsland;Ljava/util/List;)V

    return-void
.end method
