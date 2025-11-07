import enum
from sqlalchemy import TEXT, Column, Enum, ForeignKey
from db.base import Base


class VisibilityStatus(enum.Enum):
    PRIVATE = "private"
    PUBLIC = "public"
    UNLISTED = "unlisted"


class ProcessingStatus(enum.Enum):
    COMPLETED = "completed"
    PROCESSING = "processing"
    FAILED = "failed"


class Video(Base):
    __tablename__ = "videos"

    id = Column(TEXT, primary_key=True, index=True)
    title = Column(TEXT)
    description = Column(TEXT)
    user_id = Column(TEXT, ForeignKey("users.id"))
    video_s3_key = Column(TEXT)
    visibility = Column(
        Enum(VisibilityStatus),
        nullable=False,
        default=VisibilityStatus.PRIVATE,
    )
    is_processing = Column(
        Enum(ProcessingStatus),
        nullable=False,
        default=ProcessingStatus.PROCESSING,
    )
